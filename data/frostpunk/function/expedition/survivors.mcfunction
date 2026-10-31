execute store result score #a fp run random value 5..12
scoreboard players operation #pop fp += #a fp
scoreboard players operation #t fp = #a fp
scoreboard players operation #t fp /= #c3 fp
scoreboard players operation #children fp += #t fp
scoreboard players add #hope fp 3
function frostpunk:law/clamp
tellraw @a [{"text":"🧭 Разведчики привели выживших: ","color":"green"},{"score":{"name":"#a","objective":"fp"},"color":"white"},{"text":" чел. Им нужны дом и еда.","color":"green"}]
