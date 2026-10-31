# Снос ближайшего здания (кроме генератора) в радиусе 12 блоков. Выполняет Капитан.
execute unless entity @e[type=marker,tag=fp_building,tag=!fp_generator,distance=..12] run return run tellraw @s {"text":"Рядом (12 блоков) нет зданий для сноса.","color":"red"}
execute as @n[type=marker,tag=fp_building,tag=!fp_generator,distance=..12] at @s run function frostpunk:demolish/by_type
