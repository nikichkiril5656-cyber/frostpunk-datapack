scoreboard players operation #dead_total fp += #scout_men fp
scoreboard players remove #hope fp 5
scoreboard players add #disc fp 3
function frostpunk:law/clamp
tellraw @a [{"text":"🧭 Отряд разведчиков не вернулся. Погибло людей: ","color":"dark_red"},{"score":{"name":"#scout_men","objective":"fp"},"color":"red"}]
