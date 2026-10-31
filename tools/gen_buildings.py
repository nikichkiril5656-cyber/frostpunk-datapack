#!/usr/bin/env python3
"""Генератор функций строительства: data/frostpunk/function/build/place/**.

Каждое здание описано один раз (вход на СЕВЕРЕ, координаты относительно центра
участка 7x7: x на восток, z на юг, y вверх, пол на y=-1). Скрипт поворачивает
описание на 0/90/180/270 градусов, чтобы вход смотрел на игрока:

  build/place/<тип>/r0..r3.mcfunction   (r0 — игрок смотрит на юг, вход на севере)
  build/place/generator.mcfunction      (симметричный, без поворотов)

Запуск: python3 tools/gen_buildings.py
CI проверяет, что сгенерированные файлы совпадают с закоммиченными.
"""
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PLACE = ROOT / "data/frostpunk/function/build/place"
DIRS = ["north", "east", "south", "west"]
HEADER = "# Автогенерация: tools/gen_buildings.py. Не править вручную.\n"


def rel(v):
    return "~" if v == 0 else f"~{v}"


class B:
    """Набор команд с поворотом на rot*90° по часовой стрелке (вид сверху)."""

    def __init__(self, rot=0, limit_y=12):
        self.rot = rot
        self.limit_y = limit_y
        self.cmds = []

    # --- служебное ---
    def _rp(self, x, z):
        for _ in range(self.rot):
            x, z = -z, x
        return x, z

    def _state(self, block, props):
        p = dict(props)
        if p.get("facing") in DIRS:
            p["facing"] = DIRS[(DIRS.index(p["facing"]) + self.rot) % 4]
        if p.get("axis") in ("x", "z") and self.rot % 2:
            p["axis"] = "z" if p["axis"] == "x" else "x"
        if p.get("shape") in ("north_south", "east_west") and self.rot % 2:
            p["shape"] = "east_west" if p["shape"] == "north_south" else "north_south"
        if "rotation" in p:
            p["rotation"] = (p["rotation"] + 4 * self.rot) % 16
        s = f"minecraft:{block}"
        if p:
            s += "[" + ",".join(
                f"{k}={str(v).lower() if isinstance(v, bool) else v}" for k, v in p.items()
            ) + "]"
        return s

    def _chk(self, x, y, z):
        assert -3 <= x <= 3 and -3 <= z <= 3, ("вне участка 7x7", x, y, z)
        assert -5 <= y <= self.limit_y, ("высота вне допустимой", x, y, z)

    # --- примитивы ---
    def set(self, x, y, z, block, **props):
        self._chk(x, y, z)
        rx, rz = self._rp(x, z)
        self.cmds.append(f"setblock {rel(rx)} {rel(y)} {rel(rz)} {self._state(block, props)}")

    def fill(self, x1, y1, z1, x2, y2, z2, block, mode="", **props):
        self._chk(x1, y1, z1)
        self._chk(x2, y2, z2)
        ax, az = self._rp(x1, z1)
        bx, bz = self._rp(x2, z2)
        tail = f" {mode}" if mode else ""
        self.cmds.append(
            f"fill {rel(ax)} {rel(y1)} {rel(az)} {rel(bx)} {rel(y2)} {rel(bz)} "
            f"{self._state(block, props)}{tail}"
        )

    def marker(self, *tags):
        t = ",".join(f'"{x}"' for x in ("fp", "fp_building", *tags))
        self.cmds.append(f"summon minecraft:marker ~ ~ ~ {{Tags:[{t}]}}")

    # --- составные ---
    def clear(self, h):
        self.fill(-3, 0, -3, 3, h, 3, "air")

    def foundation(self):
        # подсыпаем камень только в пустоты под участком (склоны, ямы)
        self.fill(-3, -5, -3, 3, -2, 3, "cobblestone", "keep")

    def floor(self, block, r=3):
        self.fill(-r, -1, -r, r, -1, r, block)

    def walls(self, x1, z1, x2, z2, y1, y2, block, **props):
        self.fill(x1, y1, z1, x2, y2, z2, block, **props)
        self.fill(x1 + 1, y1, z1 + 1, x2 - 1, y2, z2 - 1, "air")

    def door(self, x, y, z, block, facing="north"):
        self.set(x, y, z, block, facing=facing, half="lower")
        self.set(x, y + 1, z, block, facing=facing, half="upper")

    def bed(self, x, y, z, color="red", facing="south"):
        self.set(x, y, z, f"{color}_bed", facing=facing, part="foot")
        dx, dz = {"north": (0, -1), "south": (0, 1), "east": (1, 0), "west": (-1, 0)}[facing]
        self.set(x + dx, y, z + dz, f"{color}_bed", facing=facing, part="head")

    def gable(self, x0, x1, z0, z1, y, stair, plank, slab=None, infill=None):
        """Двускатная крыша, конёк вдоль z. Ступени поднимаются к центру."""
        hw = (x1 - x0) // 2
        cx = (x0 + x1) // 2
        for i in range(hw):
            self.fill(x0 + i, y + i, z0, x0 + i, y + i, z1, stair, facing="east", half="bottom")
            self.fill(x1 - i, y + i, z0, x1 - i, y + i, z1, stair, facing="west", half="bottom")
        self.fill(cx, y + hw - 1, z0, cx, y + hw - 1, z1, plank)
        if slab:
            self.fill(cx, y + hw, z0, cx, y + hw, z1, slab, type="bottom")
        if infill:
            for i in range(hw):
                lo, hi = x0 + i + 1, x1 - i - 1
                if lo <= hi:
                    for z in (z0, z1):
                        self.fill(lo, y + i, z, hi, y + i, z, infill)


# ----------------------------------------------------------------------------
# Здания (вход на севере, z=-3)
# ----------------------------------------------------------------------------

def tent(b):
    b.clear(6)
    b.foundation()
    b.floor("coarse_dirt")
    b.fill(-2, -1, -2, 2, -1, 2, "spruce_planks")
    # скаты палатки
    b.fill(-2, 0, -2, -2, 0, 2, "white_wool")
    b.fill(2, 0, -2, 2, 0, 2, "white_wool")
    b.fill(-1, 1, -2, -1, 1, 2, "light_gray_wool")
    b.fill(1, 1, -2, 1, 1, 2, "light_gray_wool")
    b.fill(0, 2, -2, 0, 2, 2, "red_wool")
    # задняя стенка и фронт с проёмом
    b.fill(-1, 0, 2, 1, 0, 2, "white_wool")
    b.set(0, 1, 2, "light_gray_wool")
    b.set(-1, 0, -2, "white_wool")
    b.set(1, 0, -2, "white_wool")
    # внутри
    b.bed(-1, 0, -1, "red", "south")
    b.set(1, 0, 1, "barrel", facing="up")
    b.set(0, 1, 0, "lantern", hanging=True)
    # снаружи: костёр и фонарь на столбе
    b.set(2, 0, -3, "campfire", lit=True)
    b.set(-2, 0, -3, "spruce_fence")
    b.set(-2, 1, -3, "lantern")
    b.marker("fp_tent", "fp_shelter")


def house(b):
    b.clear(11)
    b.foundation()
    b.floor("cobblestone")
    b.fill(-2, -1, -2, 2, -1, 2, "spruce_planks")
    b.walls(-3, -3, 3, 3, 0, 3, "spruce_planks")
    # каменный цоколь
    b.fill(-3, 0, -3, 3, 0, 3, "cobblestone")
    b.fill(-2, 0, -2, 2, 0, 2, "air")
    # угловые и средние стойки
    for sx in (-3, 3):
        for sz in (-3, 3):
            b.fill(sx, 0, sz, sx, 3, sz, "stripped_spruce_log", axis="y")
    for sx in (-3, 3):
        b.fill(sx, 1, 0, sx, 3, 0, "spruce_log", axis="y")
    b.fill(0, 1, 3, 0, 3, 3, "spruce_log", axis="y")
    # дверь и окна
    b.door(0, 0, -3, "spruce_door")
    for z in (-1, 1):
        b.set(-3, 1, z, "glass_pane")
        b.set(3, 1, z, "glass_pane")
    b.set(-1, 1, 3, "glass_pane")
    b.set(1, 1, 3, "glass_pane")
    b.set(-1, 2, -3, "glass_pane")
    b.set(1, 2, -3, "glass_pane")
    # крыша
    b.gable(-3, 3, -3, 3, 4, "spruce_stairs", "spruce_planks", slab="spruce_slab", infill="spruce_planks")
    # печь с трубой
    b.set(2, 0, 2, "furnace", facing="north", lit=True)
    b.fill(2, 1, 2, 2, 7, 2, "bricks")
    b.set(2, 8, 2, "campfire", lit=True)
    # обстановка
    b.bed(-2, 0, 0, "red", "south")
    b.set(-2, 0, -2, "crafting_table")
    b.set(-2, 1, -2, "lantern")
    b.set(-2, 0, 2, "barrel", facing="up")
    b.marker("fp_house", "fp_shelter")


def hub(b):
    b.clear(10)
    b.foundation()
    b.floor("stone_bricks")
    b.fill(-2, -1, -2, 2, -1, 2, "polished_blackstone_bricks")
    for sx in (-3, 3):
        for sz in (-3, 3):
            b.set(sx, 0, sz, "stone_brick_wall")
            b.set(sx, 1, sz, "lantern")
    # котёл
    b.fill(-1, 0, -1, 1, 0, 1, "iron_block")
    b.fill(-1, 1, -1, 1, 2, 1, "copper_block")
    b.fill(-1, 3, -1, 1, 3, 1, "iron_block")
    b.set(0, 2, -1, "glass")
    # труба с паром
    b.fill(0, 4, 0, 0, 7, 0, "copper_block")
    b.set(0, 8, 0, "hay_block")
    b.set(0, 9, 0, "campfire", lit=True, signal_fire=True)
    # паропроводы в четыре стороны
    for d in (2, 3):
        b.set(d, 1, 0, "lightning_rod", facing="east")
        b.set(-d, 1, 0, "lightning_rod", facing="west")
        b.set(0, 1, d, "lightning_rod", facing="south")
        b.set(0, 1, -d, "lightning_rod", facing="north")
    b.marker("fp_hub")


def hunter(b):
    b.clear(10)
    b.foundation()
    b.floor("coarse_dirt")
    b.fill(-2, -1, -2, 2, -1, 2, "spruce_planks")
    b.walls(-2, -2, 2, 2, 0, 2, "spruce_planks")
    for sx in (-2, 2):
        for sz in (-2, 2):
            b.fill(sx, 0, sz, sx, 2, sz, "spruce_log", axis="y")
    b.door(0, 0, -2, "dark_oak_door")
    b.set(-2, 1, 0, "glass_pane")
    b.set(2, 1, 0, "glass_pane")
    b.set(0, 1, 2, "glass_pane")
    b.gable(-2, 2, -2, 2, 3, "dark_oak_stairs", "dark_oak_planks", slab="dark_oak_slab", infill="spruce_planks")
    # внутри
    b.bed(-1, 0, -1, "brown", "south")
    b.set(1, 0, 1, "smoker", facing="north", lit=True)
    b.set(-1, 0, 1, "barrel", facing="up")
    b.set(-1, 1, 1, "lantern")
    # сушилка для шкур справа
    for z in (-1, 1):
        b.fill(3, 0, z, 3, 2, z, "spruce_fence")
    b.set(3, 2, 0, "spruce_fence")
    b.set(3, 1, 0, "brown_wool")
    # поленница слева и костёр
    b.fill(-3, 0, -1, -3, 0, 1, "oak_log", axis="z")
    b.set(-3, 1, 0, "oak_log", axis="z")
    b.set(-2, 0, -3, "campfire", lit=True)
    b.marker("fp_hunter", "fp_shelter")


def mine(b):
    b.clear(8)
    b.foundation()
    b.floor("gravel")
    # каменный холм
    b.fill(-3, 0, -1, 3, 0, 3, "stone")
    b.fill(-2, 1, 0, 2, 1, 3, "andesite")
    b.fill(-1, 2, 1, 1, 2, 3, "stone")
    b.fill(0, 3, 2, 0, 3, 3, "cobblestone")
    # штольня
    b.fill(0, 0, -1, 0, 1, 2, "air")
    for sx in (-1, 1):
        b.fill(sx, 0, -1, sx, 1, -1, "dark_oak_log", axis="y")
    b.fill(-1, 2, -1, 1, 2, -1, "dark_oak_log", axis="x")
    b.fill(0, 0, -3, 0, 0, 2, "rail", shape="north_south")
    for sx in (-1, 1):
        b.set(sx, 3, -1, "lantern")  # фонари стоят на перекладине над входом
    # копёр перед входом
    for sx in (-2, 2):
        b.fill(sx, 0, -3, sx, 3, -3, "dark_oak_fence")
    b.fill(-2, 4, -3, 2, 4, -3, "dark_oak_planks")
    b.set(0, 3, -3, "lantern", hanging=True)
    # склад угля, бочка, чан
    b.fill(2, 0, -2, 3, 0, -2, "coal_block")
    b.set(3, 0, -1, "coal_block")
    b.set(3, 1, -2, "coal_block")
    b.set(-2, 0, -2, "barrel", facing="up")
    b.set(-3, 0, -2, "cauldron")
    b.marker("fp_mine", "fp_shelter")


def sawmill(b):
    b.clear(10)
    b.foundation()
    b.floor("spruce_planks")
    for sx in (-3, 3):
        for sz in (-3, 0, 3):
            b.fill(sx, 0, sz, sx, 3, sz, "oak_log", axis="y")
    b.fill(-3, 3, -3, -3, 3, 3, "stripped_oak_log", axis="z")
    b.fill(3, 3, -3, 3, 3, 3, "stripped_oak_log", axis="z")
    b.fill(-3, 3, -3, 3, 3, -3, "stripped_oak_log", axis="x")
    b.fill(-3, 3, 3, 3, 3, 3, "stripped_oak_log", axis="x")
    b.fill(0, 3, -3, 0, 3, 3, "oak_planks")
    b.gable(-3, 3, -3, 3, 4, "spruce_stairs", "spruce_planks", slab="spruce_slab")
    # рабочая зона
    b.set(0, 0, 0, "stonecutter", facing="north")
    b.set(0, 2, 0, "lantern", hanging=True)
    b.fill(-2, 0, -2, -2, 0, -1, "oak_log", axis="z")
    b.set(-2, 1, -2, "oak_log", axis="z")
    b.fill(2, 0, -2, 2, 0, -1, "spruce_planks")
    b.set(2, 1, -2, "spruce_planks")
    b.set(2, 0, 2, "barrel", facing="up")
    b.set(-2, 0, 2, "grindstone", face="floor", facing="north")
    b.marker("fp_sawmill")


def foundry(b):
    b.clear(12)
    b.foundation()
    b.floor("polished_blackstone_bricks")
    b.walls(-3, -3, 3, 3, 0, 3, "bricks")
    for sx in (-3, 3):
        for sz in (-3, 3):
            b.fill(sx, 0, sz, sx, 3, sz, "stone_bricks")
    b.door(0, 0, -3, "dark_oak_door")
    for z in (-1, 1):
        b.set(-3, 1, z, "iron_bars")
        b.set(3, 1, z, "iron_bars")
        b.set(-3, 2, z, "iron_bars")
        b.set(3, 2, z, "iron_bars")
    # плоская крыша с парапетом
    b.fill(-3, 4, -3, 3, 4, 3, "stone_brick_slab", type="bottom")
    b.fill(-3, 5, -3, 3, 5, -3, "stone_brick_wall")
    b.fill(-3, 5, 3, 3, 5, 3, "stone_brick_wall")
    b.fill(-3, 5, -3, -3, 5, 3, "stone_brick_wall")
    b.fill(3, 5, -3, 3, 5, 3, "stone_brick_wall")
    # печи и труба
    b.set(-2, 0, 2, "blast_furnace", facing="north", lit=True)
    b.set(0, 0, 2, "blast_furnace", facing="north", lit=True)
    b.set(2, 0, 2, "furnace", facing="north", lit=True)
    b.fill(2, 1, 2, 2, 9, 2, "bricks")
    b.set(2, 10, 2, "hay_block")
    b.set(2, 11, 2, "campfire", lit=True, signal_fire=True)
    # оборудование
    b.set(-1, 0, -1, "anvil", facing="east")
    b.set(1, 0, -1, "smithing_table")
    b.set(-2, 0, 0, "iron_block")
    b.set(2, 0, 0, "lava_cauldron")
    b.set(0, 3, 0, "lantern", hanging=True)
    b.marker("fp_foundry", "fp_shelter")


def medical(b):
    b.clear(10)
    b.foundation()
    b.floor("quartz_block")
    b.walls(-3, -3, 3, 3, 0, 4, "white_concrete")
    # красный крест над входом
    for x, y in ((0, 3), (-1, 3), (1, 3), (0, 2), (0, 4)):
        b.set(x, y, -3, "red_concrete")
    b.door(0, 0, -3, "birch_door")
    for z in (-1, 1):
        for y in (1, 2):
            b.set(-3, y, z, "glass_pane")
            b.set(3, y, z, "glass_pane")
    b.set(-1, 1, 3, "glass_pane")
    b.set(1, 1, 3, "glass_pane")
    # плоская крыша с крестом
    b.fill(-3, 5, -3, 3, 5, 3, "quartz_slab", type="bottom")
    for x, z in ((0, 0), (-1, 0), (1, 0), (0, -1), (0, 1)):
        b.set(x, 5, z, "red_concrete")
    # палата
    b.bed(-2, 0, -2, "white", "south")
    b.bed(-2, 0, 0, "white", "south")
    b.bed(2, 0, -2, "white", "south")
    b.bed(2, 0, 0, "white", "south")
    b.set(0, 0, 2, "brewing_stand")
    b.set(1, 0, 2, "cauldron")
    b.set(0, 4, 0, "lantern", hanging=True)
    b.marker("fp_medical", "fp_shelter")


def guard(b):
    b.clear(11)
    b.foundation()
    b.floor("stone_bricks")
    b.walls(-2, -2, 2, 2, 0, 5, "stone_bricks")
    # верхняя площадка; лестница проходит сквозь неё (люк = клетка с лестницей)
    b.fill(-2, 6, -2, 2, 6, 2, "stone_bricks")
    b.fill(1, 0, -1, 1, 6, -1, "ladder", facing="south")
    # зубцы
    for x in range(-2, 3):
        for z in range(-2, 3):
            if (abs(x) == 2 or abs(z) == 2) and (x + z) % 2 == 0:
                b.set(x, 7, z, "stone_brick_wall")
    b.door(0, 0, -2, "dark_oak_door")
    # бойницы
    for pos in ((-2, 2, 0), (2, 2, 0), (0, 2, 2), (-2, 4, 0), (2, 4, 0), (0, 4, 2), (0, 4, -2)):
        b.set(*pos, "iron_bars")
    # знамя и фонари у входа
    b.set(0, 3, -3, "red_wall_banner", facing="north")
    for sx in (-2, 2):
        b.set(sx, 0, -3, "stone_brick_wall")
        b.set(sx, 1, -3, "lantern")
    # внутри
    b.set(-1, 0, 1, "grindstone", face="floor", facing="north")
    b.set(-1, 0, -1, "barrel", facing="up")
    b.set(-1, 1, -1, "lantern")
    b.marker("fp_guard", "fp_shelter")


def prayer(b):
    b.clear(12)
    b.foundation()
    b.floor("smooth_quartz")
    b.walls(-2, -3, 2, 3, 0, 3, "quartz_bricks")
    for sx in (-2, 2):
        for sz in (-3, 3):
            b.fill(sx, 0, sz, sx, 3, sz, "quartz_pillar", axis="y")
    b.gable(-2, 2, -3, 3, 4, "stone_brick_stairs", "stone_bricks", slab="stone_brick_slab", infill="quartz_bricks")
    b.door(0, 0, -3, "birch_door")
    # витражи
    for z in (-1, 1):
        for y in (1, 2):
            b.set(-2, y, z, "purple_stained_glass_pane")
            b.set(2, y, z, "purple_stained_glass_pane")
    b.set(0, 1, 3, "purple_stained_glass_pane")
    b.set(0, 2, 3, "purple_stained_glass_pane")
    b.set(0, 4, -3, "amethyst_block")
    # шпиль
    b.fill(0, 6, 0, 0, 8, 0, "quartz_pillar", axis="y")
    b.set(0, 9, 0, "lightning_rod", facing="up")
    # внутри: скамьи, кафедра, свечи
    for z in (-1, 0, 1):
        b.set(-1, 0, z, "quartz_slab", type="bottom")
        b.set(1, 0, z, "quartz_slab", type="bottom")
    b.set(0, 0, 2, "lectern", facing="north")
    b.set(-1, 0, 2, "candle", candles=3, lit=True)
    b.set(1, 0, 2, "candle", candles=3, lit=True)
    b.set(0, 4, 0, "lantern", hanging=True)
    b.marker("fp_prayer", "fp_shelter")


def generator(b):
    b.clear(14)
    b.foundation()
    b.floor("polished_blackstone_bricks")
    b.fill(-2, -1, -2, 2, -1, 2, "iron_block")
    for sx in (-3, 3):
        for sz in (-3, 3):
            b.set(sx, -1, sz, "chiseled_polished_blackstone")
            b.set(sx, 0, sz, "stone_brick_wall")
            b.set(sx, 1, sz, "lantern")
    # котёл
    b.fill(-1, 0, -1, 1, 0, 1, "iron_block")
    b.fill(-1, 1, -1, 1, 4, 1, "copper_block")
    b.fill(-1, 5, -1, 1, 5, 1, "iron_block")
    # дымовая труба с сигнальным дымом
    b.fill(0, 6, 0, 0, 11, 0, "blackstone")
    b.set(0, 12, 0, "hay_block")
    b.set(0, 13, 0, "campfire", lit=True, signal_fire=True)
    # лампы уровня нагрева (их меняет gen/visual: x=-2, y=2..4)
    b.set(-2, 1, 0, "iron_block")
    b.set(-2, 2, 0, "glowstone")
    b.set(-2, 3, 0, "coal_block")
    b.set(-2, 4, 0, "coal_block")
    b.set(-2, 5, 0, "iron_block")
    # паропроводы
    for d in (2, 3):
        b.set(0, 3, -d, "lightning_rod", facing="north")
        b.set(0, 3, d, "lightning_rod", facing="south")
        b.set(d, 3, 0, "lightning_rod", facing="east")
    # угольный бункер и топки
    b.fill(2, 0, -2, 3, 0, -2, "coal_block")
    b.set(3, 0, -1, "coal_block")
    b.set(2, 1, -2, "coal_block")
    b.set(-2, 0, 2, "blast_furnace", facing="east", lit=True)
    b.set(2, 0, 2, "blast_furnace", facing="west", lit=True)
    b.set(-2, 0, -2, "barrel", facing="up")
    b.marker("fp_generator")


BUILDINGS = {
    "tent": tent, "house": house, "hub": hub, "hunter": hunter, "mine": mine,
    "sawmill": sawmill, "foundry": foundry, "medical": medical, "guard": guard,
    "prayer": prayer,
}


def write(path, cmds):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(HEADER + "\n".join(cmds) + "\n", encoding="utf-8")


def main():
    total = 0
    for name, fn in BUILDINGS.items():
        for rot in range(4):
            b = B(rot)
            fn(b)
            write(PLACE / name / f"r{rot}.mcfunction", b.cmds)
            total += len(b.cmds)
    g = B(0, limit_y=14)
    generator(g)
    write(PLACE / "generator.mcfunction", g.cmds)
    total += len(g.cmds)
    print(f"сгенерировано: {len(BUILDINGS) * 4 + 1} функций, {total} команд")


if __name__ == "__main__":
    main()
