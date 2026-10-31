execute if score #law_soup fp matches 1 run return run tellraw @s {"text":"Закон уже принят.","color":"red"}
execute if score #law_rations fp matches 1 run return run tellraw @s {"text":"Несовместим с «Двойными пайками».","color":"red"}
execute unless function frostpunk:law/begin run return fail
scoreboard players set #law_soup fp 1
scoreboard players set #ration_div fp 10
scoreboard players remove #hope fp 5
function frostpunk:law/clamp
tellraw @a [{"text":"📜 Принят закон: ","color":"yellow"},{"text":"Опилочный суп","color":"gold","bold":true},{"text":" — еды нужно меньше, но люди чаще болеют.","color":"gray"}]
