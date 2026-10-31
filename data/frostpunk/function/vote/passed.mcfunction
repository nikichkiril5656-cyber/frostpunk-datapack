tellraw @a {"text":"✔ Законопроект принят.","color":"green"}
scoreboard players operation #pending_law fp = #vote_law fp
scoreboard players set #vote_pass fp 1
execute if entity @a[tag=fp_proposer] as @a[tag=fp_proposer,limit=1] run function frostpunk:vote/apply
execute unless entity @a[tag=fp_proposer] as @a[tag=fp_captain,limit=1] run function frostpunk:vote/apply
scoreboard players set #vote_pass fp 0
tag @a remove fp_proposer
