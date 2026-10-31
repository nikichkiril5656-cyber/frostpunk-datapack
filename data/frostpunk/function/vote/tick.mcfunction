# Раз в секунду, пока идёт голосование
scoreboard players remove #vote_t fp 1
execute store result score #heads fp if entity @a[tag=fp_head]
execute store result score #voted fp if entity @a[tag=fp_head,scores={fp_vote=1..}]
# все главы проголосовали или глав не осталось: заканчиваем досрочно
execute if score #heads fp matches 1.. if score #voted fp >= #heads fp run scoreboard players set #vote_t fp 0
execute if score #heads fp matches 0 run scoreboard players set #vote_t fp 0
execute if score #vote_t fp matches 15 run tellraw @a {"text":"🗳 До конца голосования 15 секунд.","color":"gold"}
execute if score #vote_t fp matches 0 run function frostpunk:vote/resolve
