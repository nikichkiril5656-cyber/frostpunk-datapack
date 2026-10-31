execute if score #law_child fp matches 1 run return run tellraw @s {"text":"Закон уже принят.","color":"red"}
execute unless function frostpunk:law/begin run return fail
scoreboard players set #law_child fp 1
scoreboard players remove #hope fp 10
scoreboard players add #disc fp 10
function frostpunk:law/clamp
tellraw @a [{"text":"📜 Принят закон: ","color":"yellow"},{"text":"Детский труд","color":"gold","bold":true},{"text":" — дети встают к станкам. Рабочих больше, надежды меньше.","color":"gray"}]
