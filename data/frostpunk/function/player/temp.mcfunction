# Локальная температура игрока = улица + лучший источник тепла рядом + одежда
scoreboard players set @s fp_bonus 0

# Генератор: радиус тепла растёт с уровнем
execute if score #gen_active fp matches 1 if entity @e[type=marker,tag=fp_generator,distance=..9] run scoreboard players operation @s fp_bonus > #gen_bonus fp
execute if score #gen_active fp matches 2 if entity @e[type=marker,tag=fp_generator,distance=..13] run scoreboard players operation @s fp_bonus > #gen_bonus fp
execute if score #gen_active fp matches 3 if entity @e[type=marker,tag=fp_generator,distance=..17] run scoreboard players operation @s fp_bonus > #gen_bonus fp

# Паровые узлы передают тепло генератора
execute if score #gen_active fp matches 1.. if entity @e[type=marker,tag=fp_hub,distance=..7] run scoreboard players operation @s fp_bonus > #gen_bonus fp

# Укрытия (палатки, дома, медпункты, караульные...) держат тепло
execute if entity @e[type=marker,tag=fp_shelter,distance=..4.5] run scoreboard players operation @s fp_bonus > #shelter_bonus fp

# Кожаная одежда как «тёплое пальто»
execute if items entity @s armor.head minecraft:leather_helmet run scoreboard players add @s fp_bonus 4
execute if items entity @s armor.chest minecraft:leather_chestplate run scoreboard players add @s fp_bonus 6
execute if items entity @s armor.legs minecraft:leather_leggings run scoreboard players add @s fp_bonus 5
execute if items entity @s armor.feet minecraft:leather_boots run scoreboard players add @s fp_bonus 4

scoreboard players operation @s fp_local = #out_temp fp
scoreboard players operation @s fp_local += @s fp_bonus
scoreboard players operation @s fp_local < #c15 fp
