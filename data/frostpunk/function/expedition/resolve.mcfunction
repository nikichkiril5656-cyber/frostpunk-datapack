# Исход экспедиции: 1-4 припасы, 5-6 выжившие, 7 тайник, 8 пусто, 9-10 отряд погиб
execute store result score #r fp run random value 1..10
execute if score #r fp matches 9..10 run return run function frostpunk:expedition/lost

scoreboard players operation #pop fp += #scout_men fp
execute if score #r fp matches 1..4 run function frostpunk:expedition/supplies
execute if score #r fp matches 5..6 run function frostpunk:expedition/survivors
execute if score #r fp matches 7 run function frostpunk:expedition/cache
execute if score #r fp matches 8 run tellraw @a [{"text":"🧭 Разведчики вернулись ни с чем: только следы в снегу.","color":"gray"}]
