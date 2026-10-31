# Локальная температура игрока = улица + климат места + источники тепла и одежда
# (выполняется от имени игрока на его позиции)

# 1. Климат места (fp_env)
scoreboard players set @s fp_env 0
execute if biome ~ ~ ~ #frostpunk:cold run scoreboard players set @s fp_env -12
execute if biome ~ ~ ~ #frostpunk:hot run scoreboard players set @s fp_env 65
# Под землёй (шахты, пещеры) всегда холодно, жара пустыни туда не доходит; глубже ещё холоднее
execute unless dimension minecraft:the_nether if predicate frostpunk:underground run scoreboard players operation @s fp_env < #c0 fp
execute unless dimension minecraft:the_nether if predicate frostpunk:underground run scoreboard players remove @s fp_env 10
execute unless dimension minecraft:the_nether if predicate frostpunk:deep run scoreboard players remove @s fp_env 10
# Нижний мир зимы не знает: там всегда +40
execute if dimension minecraft:the_nether run scoreboard players set @s fp_env 40
execute if dimension minecraft:the_nether run scoreboard players operation @s fp_env -= #out_temp fp

# 2. Источники тепла
scoreboard players set @s fp_bonus 0
# Генератор: радиус тепла растёт с уровнем
execute if score #gen_active fp matches 1 if entity @e[type=marker,tag=fp_generator,distance=..9] run scoreboard players operation @s fp_bonus > #gen_bonus fp
execute if score #gen_active fp matches 2 if entity @e[type=marker,tag=fp_generator,distance=..13] run scoreboard players operation @s fp_bonus > #gen_bonus fp
execute if score #gen_active fp matches 3 if entity @e[type=marker,tag=fp_generator,distance=..17] run scoreboard players operation @s fp_bonus > #gen_bonus fp
# Паровые узлы передают тепло генератора
execute if score #gen_active fp matches 1.. if entity @e[type=marker,tag=fp_hub,distance=..7] run scoreboard players operation @s fp_bonus > #gen_bonus fp
# Укрытия (палатки, дома, медпункты, караульные...) держат тепло
execute if entity @e[type=marker,tag=fp_shelter,distance=..4.5] run scoreboard players operation @s fp_bonus > #shelter_bonus fp
# Кожаная одежда как «тёплое пальто» (в жару она вредит!)
execute if items entity @s armor.head minecraft:leather_helmet run scoreboard players add @s fp_bonus 4
execute if items entity @s armor.chest minecraft:leather_chestplate run scoreboard players add @s fp_bonus 6
execute if items entity @s armor.legs minecraft:leather_leggings run scoreboard players add @s fp_bonus 5
execute if items entity @s armor.feet minecraft:leather_boots run scoreboard players add @s fp_bonus 4

# 3. Итог
scoreboard players operation @s fp_local = #out_temp fp
scoreboard players operation @s fp_local += @s fp_env
scoreboard players operation @s fp_local += @s fp_bonus
# Укрытие держит комфорт и в жару (не выше +20)
execute if entity @e[type=marker,tag=fp_shelter,distance=..4.5] run scoreboard players operation @s fp_local < #c20 fp
scoreboard players operation @s fp_local < #c70 fp
