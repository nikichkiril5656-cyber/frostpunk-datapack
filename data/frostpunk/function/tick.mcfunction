scoreboard players enable @a fp_menu
execute as @a[scores={fp_menu=1..}] at @s run function frostpunk:menu/dispatch
scoreboard players set @a[scores={fp_menu=1..}] fp_menu 0
execute if score #running fp matches 1 run function frostpunk:loop/tick
