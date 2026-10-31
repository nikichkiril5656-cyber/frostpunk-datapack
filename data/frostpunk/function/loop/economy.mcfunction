# ---------- Рабочая сила ----------
scoreboard players operation #workers fp = #pop fp
scoreboard players operation #workers fp -= #children fp
scoreboard players operation #workers fp -= #sick fp
execute if score #law_child fp matches 1 run scoreboard players operation #workers fp += #children fp
scoreboard players operation #workers fp > #c0 fp

# ---------- Рабочие места ----------
scoreboard players set #jobs fp 0
scoreboard players operation #t fp = #n_hunter fp
scoreboard players operation #t fp *= #c4 fp
scoreboard players operation #jobs fp += #t fp
scoreboard players set #m fp 8
scoreboard players operation #t fp = #n_mine fp
scoreboard players operation #t fp *= #m fp
scoreboard players operation #jobs fp += #t fp
scoreboard players operation #t fp = #n_sawmill fp
scoreboard players operation #t fp *= #c5 fp
scoreboard players operation #jobs fp += #t fp
scoreboard players operation #t fp = #n_foundry fp
scoreboard players operation #t fp *= #m fp
scoreboard players operation #jobs fp += #t fp
scoreboard players operation #t fp = #n_medical fp
scoreboard players operation #t fp *= #c4 fp
scoreboard players operation #jobs fp += #t fp
scoreboard players operation #t fp = #n_guard fp
scoreboard players operation #t fp *= #c3 fp
scoreboard players operation #jobs fp += #t fp
scoreboard players operation #t fp = #n_prayer fp
scoreboard players operation #t fp *= #c2 fp
scoreboard players operation #jobs fp += #t fp
scoreboard players operation #t fp = #n_hub fp
scoreboard players operation #t fp *= #c2 fp
scoreboard players operation #jobs fp += #t fp

# ---------- Эффективность: хватает ли людей ----------
scoreboard players set #eff fp 100
execute if score #jobs fp > #workers fp run scoreboard players operation #eff fp = #workers fp
execute if score #jobs fp > #workers fp run scoreboard players operation #eff fp *= #c100 fp
execute if score #jobs fp > #workers fp run scoreboard players operation #eff fp /= #jobs fp

# ---------- Производство (множитель #mult даёт закон о сменах) ----------
function frostpunk:loop/prod {n:"#n_hunter",res:"#food",base:8}
function frostpunk:loop/prod {n:"#n_mine",res:"#coal",base:9}
function frostpunk:loop/prod {n:"#n_sawmill",res:"#wood",base:7}
function frostpunk:loop/prod {n:"#n_foundry",res:"#steel",base:5}

# ---------- Еда ----------
scoreboard players operation #need fp = #pop fp
scoreboard players operation #need fp /= #ration_div fp
scoreboard players operation #need fp > #c1 fp
scoreboard players set #hungry fp 0
execute if score #food fp < #need fp run scoreboard players set #hungry fp 1
execute if score #hungry fp matches 1 run scoreboard players set #food fp 0
execute if score #hungry fp matches 0 run scoreboard players operation #food fp -= #need fp
execute if score #hungry fp matches 1 run tellraw @a [{"text":"⚠ Еда закончилась! Люди голодают.","color":"red"}]

# ---------- Уголь для генератора ----------
scoreboard players set #cn fp 0
execute if score #gen_level fp matches 1 run scoreboard players set #cn fp 2
execute if score #gen_level fp matches 2 run scoreboard players set #cn fp 5
execute if score #gen_level fp matches 3 run scoreboard players set #cn fp 9
execute if score #gen_level fp matches 1.. run scoreboard players operation #cn fp += #n_hub fp
scoreboard players set #gen_active fp 0
execute if score #gen_level fp matches 1.. if score #coal fp >= #cn fp run scoreboard players operation #gen_active fp = #gen_level fp
execute if score #gen_active fp matches 1.. run scoreboard players operation #coal fp -= #cn fp
execute if score #gen_level fp matches 1.. if score #gen_active fp matches 0 run scoreboard players set #coal fp 0
execute if score #gen_level fp matches 1.. if score #gen_active fp matches 0 run tellraw @a [{"text":"⚠ В генераторе нет угля! Тепло исчезает.","color":"red"}]

scoreboard players operation #gen_bonus fp = #gen_active fp
scoreboard players operation #gen_bonus fp *= #c15 fp
