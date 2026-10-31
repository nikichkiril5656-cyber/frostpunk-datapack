scoreboard players set #tick fp 0
scoreboard players add #hour fp 1
execute if score #hour fp matches 24.. run function frostpunk:loop/new_day
execute if score #running fp matches 0 run return 0

execute if score #law_cd fp matches 1.. run scoreboard players remove #law_cd fp 1
function frostpunk:district/refresh

execute if score #scout fp matches 1.. run function frostpunk:expedition/tick

function frostpunk:loop/economy
function frostpunk:loop/climate
function frostpunk:loop/mood

execute as @e[type=marker,tag=fp_generator] at @s run function frostpunk:gen/visual
