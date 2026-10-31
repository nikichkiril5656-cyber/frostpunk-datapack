execute if score #law_martial fp matches 1 run return run tellraw @s {"text":"Закон уже принят.","color":"red"}
execute if score #law_faith fp matches 1 run return run tellraw @s {"text":"Несовместим с «Учением веры».","color":"red"}
execute unless score #n_guard fp matches 1.. run return run tellraw @s {"text":"Нужна хотя бы одна караульная.","color":"red"}
execute unless function frostpunk:law/begin run return fail
scoreboard players set #law_martial fp 1
scoreboard players remove #disc fp 10
scoreboard players remove #hope fp 5
function frostpunk:law/clamp
tellraw @a [{"text":"📜 Принят закон: ","color":"yellow"},{"text":"Мартиальный закон","color":"gold","bold":true},{"text":" — порядок держится на штыках.","color":"gray"}]
