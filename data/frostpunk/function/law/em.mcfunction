execute if score #law_em fp matches 1 run return run tellraw @s {"text":"Закон уже принят.","color":"red"}
execute unless score #law_ext fp matches 1 run return run tellraw @s {"text":"Сначала примите «Удлинённые смены».","color":"red"}
execute unless function frostpunk:law/begin run return fail
scoreboard players set #law_em fp 1
scoreboard players set #mult fp 150
scoreboard players add #disc fp 10
function frostpunk:law/clamp
tellraw @a [{"text":"📜 Принят закон: ","color":"yellow"},{"text":"Аварийные смены","color":"gold","bold":true},{"text":" — производство +50%, люди работают на износ.","color":"gray"}]
