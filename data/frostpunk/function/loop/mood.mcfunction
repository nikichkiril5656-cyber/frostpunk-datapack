# ---------- Недовольство и надежда ----------
execute if score #hungry fp matches 1 run scoreboard players add #disc fp 3
execute if score #hungry fp matches 1 run scoreboard players remove #hope fp 2
execute if score #city_temp fp matches ..-26 run scoreboard players add #disc fp 1
execute if score #city_temp fp matches ..-51 run scoreboard players add #disc fp 2
execute if score #pop fp > #housing fp run scoreboard players add #disc fp 2
execute if score #pop fp > #housing fp run scoreboard players remove #hope fp 1
execute if score #dead fp matches 1.. run scoreboard players operation #hope fp -= #dead fp
execute if score #dead fp matches 1.. run scoreboard players operation #disc fp += #dead fp

# Караульные снижают недовольство (мартиальный закон усиливает)
scoreboard players operation #t fp = #n_guard fp
scoreboard players operation #t fp *= #c2 fp
execute if score #law_martial fp matches 1 run scoreboard players operation #t fp += #n_guard fp
scoreboard players operation #t fp *= #eff fp
scoreboard players operation #t fp /= #c100 fp
# Район порядка (глава на посту): караульные +25%
execute if score #d5 fp matches 1 run scoreboard players operation #t fp *= #c125 fp
execute if score #d5 fp matches 1 run scoreboard players operation #t fp /= #c100 fp
scoreboard players operation #disc fp -= #t fp

# Молельные дома дают надежду (учение веры усиливает)
scoreboard players operation #t fp = #n_prayer fp
execute if score #law_faith fp matches 1 run scoreboard players operation #t fp *= #c2 fp
scoreboard players operation #t fp *= #eff fp
scoreboard players operation #t fp /= #c100 fp
# Духовный район (глава на посту): молельные дома +25%
execute if score #d6 fp matches 1 run scoreboard players operation #t fp *= #c125 fp
execute if score #d6 fp matches 1 run scoreboard players operation #t fp /= #c100 fp
scoreboard players operation #hope fp += #t fp

# В полдень, если всё спокойно, люди немного успокаиваются
execute if score #hour fp matches 12 if score #hungry fp matches 0 if score #city_temp fp matches -25.. run scoreboard players remove #disc fp 2
execute if score #hour fp matches 12 if score #hungry fp matches 0 if score #city_temp fp matches -25.. run scoreboard players add #hope fp 1

scoreboard players operation #hope fp > #c0 fp
scoreboard players operation #hope fp < #c100 fp
scoreboard players operation #disc fp > #c0 fp
scoreboard players operation #disc fp < #c100 fp

# ---------- Условия поражения ----------
execute if score #pop fp matches ..0 run return run function frostpunk:end/finish {title:"ГОРОД ВЫМЕР",sub:"Не осталось ни одного жителя.",color:"dark_red"}
execute if score #disc fp matches 100.. run return run function frostpunk:end/finish {title:"ИЗГНАНИЕ",sub:"Недовольство достигло предела. Капитана выгнали в метель.",color:"dark_red"}
execute if score #hope fp matches ..0 run return run function frostpunk:end/finish {title:"ОТЧАЯНИЕ",sub:"Надежды не осталось. Люди сдались.",color:"dark_red"}
