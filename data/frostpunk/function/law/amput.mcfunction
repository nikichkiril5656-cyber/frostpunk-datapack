execute if score #law_amput fp matches 1 run return run tellraw @s {"text":"Закон уже принят.","color":"red"}
execute unless score #n_medical fp matches 1.. run return run tellraw @s {"text":"Нужен хотя бы один медпункт.","color":"red"}
execute unless function frostpunk:law/begin run return fail
scoreboard players set #law_amput fp 1
scoreboard players remove #hope fp 8
function frostpunk:law/clamp
tellraw @a [{"text":"📜 Принят закон: ","color":"yellow"},{"text":"Ампутации","color":"gold","bold":true},{"text":" — врачи спасают больше людей, но цена страшна.","color":"gray"}]
