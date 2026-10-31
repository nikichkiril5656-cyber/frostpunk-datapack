execute if score #law_rations fp matches 1 run return run tellraw @s {"text":"Закон уже принят.","color":"red"}
execute if score #law_soup fp matches 1 run return run tellraw @s {"text":"Несовместим с «Опилочным супом».","color":"red"}
execute unless function frostpunk:law/begin run return fail
scoreboard players set #law_rations fp 1
scoreboard players set #ration_div fp 6
scoreboard players add #hope fp 8
scoreboard players remove #disc fp 5
function frostpunk:law/clamp
tellraw @a [{"text":"📜 Принят закон: ","color":"yellow"},{"text":"Двойные пайки","color":"gold","bold":true},{"text":" — люди сыты и спокойнее, но еды уходит больше.","color":"gray"}]
