# Макрос постройки. Аргументы: type, name, wood, steel
execute unless function frostpunk:build/check_space run return fail
$execute unless function frostpunk:build/cost {wood:$(wood),steel:$(steel)} run return fail
# Вход здания смотрит на игрока: r0 — игрок смотрит на юг, r1 — на запад, r2 — на север, r3 — на восток
execute store result score #yaw fp run data get entity @s Rotation[0] 1
scoreboard players operation #yaw fp %= #c360 fp
scoreboard players set #rot fp 0
execute if score #yaw fp matches 45..134 run scoreboard players set #rot fp 1
execute if score #yaw fp matches 135..224 run scoreboard players set #rot fp 2
execute if score #yaw fp matches 225..314 run scoreboard players set #rot fp 3
$execute if score #rot fp matches 0 rotated ~ 0 positioned ^ ^ ^6 align xyz positioned ~0.5 ~ ~0.5 run function frostpunk:build/place/$(type)/r0
$execute if score #rot fp matches 1 rotated ~ 0 positioned ^ ^ ^6 align xyz positioned ~0.5 ~ ~0.5 run function frostpunk:build/place/$(type)/r1
$execute if score #rot fp matches 2 rotated ~ 0 positioned ^ ^ ^6 align xyz positioned ~0.5 ~ ~0.5 run function frostpunk:build/place/$(type)/r2
$execute if score #rot fp matches 3 rotated ~ 0 positioned ^ ^ ^6 align xyz positioned ~0.5 ~ ~0.5 run function frostpunk:build/place/$(type)/r3
$scoreboard players add #n_$(type) fp 1
$tellraw @a [{"selector":"@s","color":"yellow"},{"text":" построил: ","color":"gray"},{"text":"$(name)","color":"green"},{"text":" (дерево -$(wood), сталь -$(steel))","color":"gray"}]
