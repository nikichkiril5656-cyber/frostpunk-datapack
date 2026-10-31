execute if score #law_ext fp matches 1 run return run tellraw @s {"text":"Закон уже принят.","color":"red"}
execute unless function frostpunk:law/begin run return fail
scoreboard players set #law_ext fp 1
scoreboard players set #mult fp 125
scoreboard players add #disc fp 8
function frostpunk:law/clamp
tellraw @a [{"text":"📜 Принят закон: ","color":"yellow"},{"text":"Удлинённые смены","color":"gold","bold":true},{"text":" — производство +25%, но люди выматываются.","color":"gray"}]
