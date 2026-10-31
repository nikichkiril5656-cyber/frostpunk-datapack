# ---------- Температура снаружи ----------
scoreboard players operation #out_temp fp = #out_base fp
execute if score #storm fp matches 1 run scoreboard players remove #out_temp fp 40
execute if score #event_cold fp matches 1 run scoreboard players remove #out_temp fp 10
execute if score #hour fp matches 0..5 run scoreboard players remove #out_temp fp 6
execute if score #hour fp matches 21..23 run scoreboard players remove #out_temp fp 6

# ---------- Утепление города (палатки, дома, паровые узлы), максимум +30 ----------
scoreboard players operation #insul fp = #n_tent fp
scoreboard players operation #t fp = #n_house fp
scoreboard players operation #t fp *= #c3 fp
scoreboard players operation #insul fp += #t fp
scoreboard players operation #t fp = #n_hub fp
scoreboard players operation #t fp *= #c2 fp
scoreboard players operation #insul fp += #t fp
scoreboard players operation #insul fp < #c30 fp

# ---------- Температура города и в укрытиях ----------
scoreboard players operation #city_temp fp = #out_temp fp
scoreboard players operation #city_temp fp += #gen_bonus fp
scoreboard players operation #city_temp fp += #insul fp
scoreboard players operation #shelter_bonus fp = #gen_bonus fp
scoreboard players operation #shelter_bonus fp /= #c2 fp
scoreboard players add #shelter_bonus fp 15

# ---------- Жильё: старые бараки на 60 мест + палатки по 4 + дома по 10 ----------
scoreboard players set #housing fp 60
scoreboard players operation #t fp = #n_tent fp
scoreboard players operation #t fp *= #c4 fp
scoreboard players operation #housing fp += #t fp
scoreboard players operation #t fp = #n_house fp
scoreboard players operation #t fp *= #c10 fp
scoreboard players operation #housing fp += #t fp

# ---------- Заболевания ----------
scoreboard players set #sick_in fp 0
execute if score #city_temp fp matches ..-16 run function frostpunk:loop/cold_sick
execute if score #law_ext fp matches 1 run scoreboard players add #sick_in fp 1
execute if score #law_em fp matches 1 run scoreboard players add #sick_in fp 3
execute if score #law_child fp matches 1 if score #law_safe fp matches 0 run scoreboard players add #sick_in fp 3
execute if score #law_child fp matches 1 if score #law_safe fp matches 1 run scoreboard players add #sick_in fp 1
execute if score #law_soup fp matches 1 run scoreboard players add #sick_in fp 2
execute if score #hungry fp matches 1 run scoreboard players add #sick_in fp 3
execute if score #pop fp > #housing fp run scoreboard players operation #t fp = #pop fp
execute if score #pop fp > #housing fp run scoreboard players operation #t fp -= #housing fp
execute if score #pop fp > #housing fp run scoreboard players operation #t fp /= #c10 fp
execute if score #pop fp > #housing fp run scoreboard players add #t fp 1
execute if score #pop fp > #housing fp run scoreboard players operation #sick_in fp += #t fp

# Лечение: медпункты (4 чел/час каждый, радикальное лечение x2), плюс естественное выздоровление в тепле
scoreboard players operation #heal fp = #n_medical fp
scoreboard players operation #heal fp *= #c4 fp
execute if score #law_radical fp matches 1 run scoreboard players operation #heal fp *= #c2 fp
scoreboard players operation #heal fp *= #eff fp
scoreboard players operation #heal fp /= #c100 fp
execute if score #city_temp fp matches -15.. run scoreboard players add #heal fp 2

scoreboard players operation #sick fp += #sick_in fp
scoreboard players operation #sick fp -= #heal fp
scoreboard players operation #sick fp > #c0 fp
scoreboard players operation #sick fp < #pop fp

# ---------- Смертность ----------
scoreboard players set #dead fp 0
# больные сверх вместимости медпунктов (10 коек на пункт, ампутации удваивают шансы)
scoreboard players operation #cap fp = #n_medical fp
scoreboard players operation #cap fp *= #c10 fp
execute if score #law_amput fp matches 1 run scoreboard players operation #cap fp *= #c2 fp
scoreboard players operation #t fp = #sick fp
scoreboard players operation #t fp -= #cap fp
scoreboard players operation #t fp > #c0 fp
scoreboard players operation #t fp /= #c4 fp
scoreboard players operation #dead fp += #t fp
# смертельный холод
execute if score #city_temp fp matches ..-61 run scoreboard players operation #t fp = #pop fp
execute if score #city_temp fp matches ..-61 run scoreboard players operation #t fp /= #c30 fp
execute if score #city_temp fp matches ..-61 run scoreboard players add #t fp 1
execute if score #city_temp fp matches ..-61 run scoreboard players operation #dead fp += #t fp
# голод
execute if score #hungry fp matches 1 run scoreboard players operation #t fp = #pop fp
execute if score #hungry fp matches 1 run scoreboard players operation #t fp /= #c25 fp
execute if score #hungry fp matches 1 run scoreboard players operation #dead fp += #t fp

scoreboard players operation #dead fp < #pop fp
execute if score #dead fp matches 1.. run function frostpunk:loop/apply_deaths
