execute if score #law_safe fp matches 1 run return run tellraw @s {"text":"Закон уже принят.","color":"red"}
execute unless score #law_child fp matches 1 run return run tellraw @s {"text":"Сначала примите «Детский труд».","color":"red"}
execute unless function frostpunk:law/begin run return fail
scoreboard players set #law_safe fp 1
scoreboard players add #hope fp 5
function frostpunk:law/clamp
tellraw @a [{"text":"📜 Принят закон: ","color":"yellow"},{"text":"Безопасные цеха","color":"gold","bold":true},{"text":" — детей ставят на безопасную работу, болезней меньше.","color":"gray"}]
