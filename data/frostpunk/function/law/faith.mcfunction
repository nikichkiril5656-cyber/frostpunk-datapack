execute if score #law_faith fp matches 1 run return run tellraw @s {"text":"Закон уже принят.","color":"red"}
execute if score #law_martial fp matches 1 run return run tellraw @s {"text":"Несовместим с «Мартиальным законом».","color":"red"}
execute unless score #n_prayer fp matches 1.. run return run tellraw @s {"text":"Нужен хотя бы один молельный дом.","color":"red"}
execute unless function frostpunk:law/begin run return fail
scoreboard players set #law_faith fp 1
scoreboard players add #hope fp 10
scoreboard players add #disc fp 5
function frostpunk:law/clamp
tellraw @a [{"text":"📜 Принят закон: ","color":"yellow"},{"text":"Учение веры","color":"gold","bold":true},{"text":" — вера даёт людям силы жить.","color":"gray"}]
