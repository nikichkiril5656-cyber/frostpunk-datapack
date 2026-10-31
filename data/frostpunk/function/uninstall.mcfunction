# Полное удаление данных пака: /function frostpunk:uninstall
kill @e[type=marker,tag=fp]
tag @a remove fp_captain
scoreboard objectives remove fp
scoreboard objectives remove fp_local
scoreboard objectives remove fp_bonus
scoreboard objectives remove fp_menu
tellraw @a {"text":"[Frostpunk] Данные удалены. Теперь можно убрать датапак.","color":"gray"}
