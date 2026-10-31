execute if score #law_radical fp matches 1 run return run tellraw @s {"text":"Закон уже принят.","color":"red"}
execute unless score #law_amput fp matches 1 run return run tellraw @s {"text":"Сначала примите «Ампутации».","color":"red"}
execute unless function frostpunk:law/begin run return fail
scoreboard players set #law_radical fp 1
scoreboard players remove #hope fp 10
function frostpunk:law/clamp
tellraw @a [{"text":"📜 Принят закон: ","color":"yellow"},{"text":"Радикальное лечение","color":"gold","bold":true},{"text":" — медпункты лечат вдвое быстрее.","color":"gray"}]
