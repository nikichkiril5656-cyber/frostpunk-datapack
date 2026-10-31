execute store result score #a fp run random value 30..50
execute store result score #b fp run random value 20..40
scoreboard players operation #steel fp += #a fp
scoreboard players operation #coal fp += #b fp
scoreboard players add #hope fp 5
function frostpunk:law/clamp
tellraw @a [{"text":"🧭 Разведчики вскрыли военный тайник: сталь +","color":"gold"},{"score":{"name":"#a","objective":"fp"},"color":"white"},{"text":", уголь +","color":"gold"},{"score":{"name":"#b","objective":"fp"},"color":"white"}]
