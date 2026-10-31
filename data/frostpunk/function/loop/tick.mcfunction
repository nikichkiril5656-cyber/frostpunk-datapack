scoreboard players add #t20 fp 1
execute if score #t20 fp matches 20.. run function frostpunk:loop/second
scoreboard players add #tick fp 1
execute if score #tick fp >= #hour_len fp run function frostpunk:loop/hour
