execute store result score #yes fp if entity @a[tag=fp_head,scores={fp_vote=1}]
execute store result score #no fp if entity @a[tag=fp_head,scores={fp_vote=2}]
execute store result score #heads fp if entity @a[tag=fp_head]
scoreboard players set #res fp 0
execute if score #yes fp > #no fp run scoreboard players set #res fp 1
# ничья: решает голос Капитана
execute if score #yes fp = #no fp if entity @a[tag=fp_captain,scores={fp_vote=1}] run scoreboard players set #res fp 1
# глав не осталось: закон принимает Капитан
execute if score #heads fp matches 0 run scoreboard players set #res fp 1
tellraw @a [{"text":"🗳 Итог голосования: за ","color":"gold"},{"score":{"name":"#yes","objective":"fp"},"color":"green"},{"text":", против ","color":"gold"},{"score":{"name":"#no","objective":"fp"},"color":"red"}]
execute if score #yes fp = #no fp if score #heads fp matches 1.. run tellraw @a {"text":"Ничья: решает голос Капитана.","color":"gray"}
execute if score #res fp matches 0 run function frostpunk:vote/rejected
execute if score #res fp matches 1 run function frostpunk:vote/passed
