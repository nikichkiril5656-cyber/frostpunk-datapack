scoreboard players set #t20 fp 0
scoreboard players add #sec fp 1
scoreboard players operation #mod2 fp = #sec fp
scoreboard players operation #mod2 fp %= #c2 fp
scoreboard players operation #mod4 fp = #sec fp
scoreboard players operation #mod4 fp %= #c4 fp

execute as @a at @s run function frostpunk:player/temp
execute as @a[gamemode=!creative,gamemode=!spectator] at @s run function frostpunk:player/effects
execute as @a run function frostpunk:player/hud
