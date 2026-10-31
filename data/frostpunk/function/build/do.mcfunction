# Макрос постройки. Аргументы: type, name, wood, steel
execute unless function frostpunk:build/check_space run return fail
$execute unless function frostpunk:build/cost {wood:$(wood),steel:$(steel)} run return fail
$execute rotated ~ 0 positioned ^ ^ ^6 align xyz positioned ~0.5 ~ ~0.5 run function frostpunk:build/place/$(type)
$scoreboard players add #n_$(type) fp 1
$tellraw @a [{"selector":"@s","color":"yellow"},{"text":" построил: ","color":"gray"},{"text":"$(name)","color":"green"},{"text":" (дерево -$(wood), сталь -$(steel))","color":"gray"}]
