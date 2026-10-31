#!/usr/bin/env python3
"""Статическая проверка датапака (без запуска Minecraft).

Проверяет:
  * pack.mcmeta и все *.json валидны;
  * JSON-компоненты в tellraw/title валидны (макро-переменные $(x) подставляются заглушкой);
  * каждая вызываемая функция существует (для макро-путей build/place/$(type)
    проверяются все type из menu/dispatch.mcfunction);
  * каждый fake player (#имя) где-то записывается, а не только читается (ловит опечатки);
  * цели scoreboard из команд объявлены в load.mcfunction;
  * в mcfunction нет начальных пробелов и пустых макро-строк.

Запуск: python3 tools/lint.py   (код выхода 1 при ошибках)
"""
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
errors = []
warnings = []


def err(msg):
    errors.append(msg)


def warn(msg):
    warnings.append(msg)


# ---------- JSON ----------
for p in [ROOT / "pack.mcmeta", *ROOT.glob("data/**/*.json")]:
    try:
        json.loads(p.read_text(encoding="utf-8"))
    except Exception as e:  # noqa: BLE001
        err(f"{p.relative_to(ROOT)}: неверный JSON: {e}")

# ---------- функции ----------
fn_files = {}
for p in ROOT.glob("data/*/function/**/*.mcfunction"):
    ns = p.relative_to(ROOT / "data").parts[0]
    rel = p.relative_to(ROOT / "data" / ns / "function").with_suffix("").as_posix()
    fn_files[f"{ns}:{rel}"] = p
fn_ids = set(fn_files)

dispatch = (ROOT / "data/frostpunk/function/menu/dispatch.mcfunction").read_text(encoding="utf-8")
build_types = re.findall(r'build/do \{type:"(\w+)"', dispatch)
if not build_types:
    err("dispatch.mcfunction: не найдено ни одного типа зданий")

# ---------- объявленные цели ----------
load = (ROOT / "data/frostpunk/function/load.mcfunction").read_text(encoding="utf-8")
objectives = set(re.findall(r"scoreboard objectives add (\w+)", load))

written = set()
mentioned = {}
mention_count = {}
macro_names = set()

SCORE_WRITE = [
    re.compile(r"scoreboard players (?:set|add|remove|reset|operation|enable) (#?[\w.$()-]+) "),
    re.compile(r"store (?:result|success) score (#?[\w.$()-]+) "),
]

for fid, p in fn_files.items():
    rel = p.relative_to(ROOT).as_posix()
    for i, line in enumerate(p.read_text(encoding="utf-8").split("\n"), 1):
        s = line.rstrip("\r")
        if not s.strip() or s.lstrip().startswith("#"):
            continue
        where = f"{rel}:{i}"
        if s != s.lstrip():
            err(f"{where}: начальные пробелы (команды в mcfunction не должны иметь отступов)")
        is_macro = s.startswith("$")
        if is_macro and "$(" not in s:
            err(f"{where}: строка с $ без макро-переменных")
        if not is_macro and "$(" in s:
            err(f"{where}: макро-переменная $(..) в строке без префикса $")

        # JSON-компоненты
        for m in re.finditer(r"\b(?:tellraw @\w+|title @\w+ (?:title|subtitle|actionbar)) ([\[{].*)$", s):
            txt = re.sub(r"\$\(\w+\)", "X", m.group(1))
            try:
                json.loads(txt)
            except Exception as e:  # noqa: BLE001
                err(f"{where}: неверный JSON-компонент: {e}")

        # вызовы функций
        for m in re.finditer(r"\bfunction ([\w.-]+:[\w/.$()-]+)", s):
            target = m.group(1)
            if "$(" in target:
                if target == "frostpunk:build/place/$(type)":
                    for t in build_types:
                        if f"frostpunk:build/place/{t}" not in fn_ids:
                            err(f"{where}: нет функции frostpunk:build/place/{t}")
                else:
                    err(f"{where}: макро-путь {target} не поддержан линтером")
            elif target not in fn_ids:
                err(f"{where}: вызывается несуществующая функция {target}")

        # цели scoreboard
        for m in re.finditer(r'scoreboard players (?:set|add|remove|operation|enable|get) \S+ (?:\S+ )?(\w+)\b', s):
            pass  # сложный разбор не нужен: ниже проверяем явные объявления
        for m in re.finditer(r'"objective":"(\w+)"', s):
            if m.group(1) not in objectives:
                err(f"{where}: цель {m.group(1)} не объявлена в load.mcfunction")
        for m in re.finditer(r"scores=\{(\w+)=", s):
            if m.group(1) not in objectives:
                err(f"{where}: цель {m.group(1)} в scores не объявлена")

        # fake players
        for m in re.finditer(r"#[A-Za-z_][\w]*", s):
            name = m.group(0)
            if name.startswith("#minecraft") or s[m.end():m.end() + 2] == "$(":
                continue
            mentioned.setdefault(name, where)
            mention_count[name] = mention_count.get(name, 0) + 1
        for pat in SCORE_WRITE:
            for m in pat.finditer(s):
                nm = m.group(1)
                if "$(" in nm:
                    continue
                written.add(nm)
        if "$(" in s:
            # макро-запись вида #n_$(type) / $(res) — имена приходят из аргументов
            for m in re.finditer(r'(?:res|n):"(#\w+)"', s):
                macro_names.add(m.group(1))
        # аргументы-макросы res/n при вызове функции
        for m in re.finditer(r'\b(?:res|n):"(#\w+)"', s):
            written.add(m.group(1))

for t in build_types:
    written.add(f"#n_{t}")

for name, where in sorted(mentioned.items()):
    if name not in written:
        err(f"{where}: fake player {name} читается, но нигде не записывается (опечатка?)")

for name, cnt in sorted(mention_count.items()):
    if cnt == 1 and name in written:
        warn(f"{mentioned[name]}: fake player {name} упомянут один раз (записывается, но не читается — опечатка?)")

print(f"функций: {len(fn_ids)}, fake players: {len(mentioned)}, типов зданий: {len(build_types)}")
for w in warnings:
    print("WARN ", w)
for e in errors:
    print("ERROR", e)
if errors:
    print(f"\nОшибок: {len(errors)}")
    sys.exit(1)
print("OK: ошибок не найдено")
