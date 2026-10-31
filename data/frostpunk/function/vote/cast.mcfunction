# Макрос. Аргумент: v (1 — за, 2 — против). Выполняет игрок.
execute unless score #vote_t fp matches 1.. run return run tellraw @s {"text":"Сейчас нет голосования.","color":"red"}
execute unless entity @s[tag=fp_head] unless entity @s[tag=fp_captain] run return run tellraw @s {"text":"Голосуют только главы районов. Капитан решает при ничьей.","color":"red"}
$scoreboard players set @s fp_vote $(v)
execute if score @s fp_vote matches 1 run tellraw @a [{"selector":"@s","color":"yellow"},{"text":" голосует ","color":"gray"},{"text":"ЗА","color":"green","bold":true}]
execute if score @s fp_vote matches 2 run tellraw @a [{"selector":"@s","color":"yellow"},{"text":" голосует ","color":"gray"},{"text":"ПРОТИВ","color":"red","bold":true}]
