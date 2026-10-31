# Полное удаление данных пака: /function frostpunk:uninstall
kill @e[type=marker,tag=fp]
tag @a remove fp_captain
tag @a remove fp_head
tag @a remove fp_proposer
tag @a remove fp_cand
tag @a remove fp_d1
tag @a remove fp_d2
tag @a remove fp_d3
tag @a remove fp_d4
tag @a remove fp_d5
tag @a remove fp_d6
scoreboard objectives remove fp
scoreboard objectives remove fp_local
scoreboard objectives remove fp_bonus
scoreboard objectives remove fp_menu
scoreboard objectives remove fp_env
scoreboard objectives remove fp_frost
scoreboard objectives remove fp_heat
scoreboard objectives remove fp_fst
scoreboard objectives remove fp_hst
scoreboard objectives remove fp_vote
tellraw @a {"text":"[Frostpunk] Данные удалены. Теперь можно убрать датапак.","color":"gray"}
