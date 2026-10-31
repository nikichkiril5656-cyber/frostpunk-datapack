# Запуск новой игры. Выполняет оператор: /function frostpunk:new_game
# Исполнитель становится Капитаном и получает Генератор перед собой.
scoreboard players reset * fp
function frostpunk:constants
kill @e[type=marker,tag=fp]

scoreboard players set #init fp 1
scoreboard players set #running fp 1

# Время (1 игровой час = #hour_len тиков; 200 тиков = 10 сек, сутки = 4 мин)
scoreboard players set #hour_len fp 200
scoreboard players set #victory_day fp 40
scoreboard players set #day fp 1
scoreboard players set #hour fp 8
scoreboard players set #tick fp 0
scoreboard players set #t20 fp 0
scoreboard players set #sec fp 0

# Население
scoreboard players set #pop fp 60
scoreboard players set #children fp 15
scoreboard players set #sick fp 0
scoreboard players set #dead fp 0
scoreboard players set #dead_total fp 0

# Ресурсы
scoreboard players set #wood fp 80
scoreboard players set #coal fp 80
scoreboard players set #steel fp 40
scoreboard players set #food fp 80

# Настроения
scoreboard players set #hope fp 50
scoreboard players set #disc fp 20

# Генератор и климат
scoreboard players set #gen_level fp 1
scoreboard players set #gen_active fp 1
scoreboard players set #gen_bonus fp 15
scoreboard players set #shelter_bonus fp 22
scoreboard players set #insul fp 0
scoreboard players set #out_base fp -22
scoreboard players set #out_temp fp -22
scoreboard players set #city_temp fp -7
scoreboard players set #storm fp 0
scoreboard players set #event_cold fp 0

# Модификаторы
scoreboard players set #mult fp 100
scoreboard players set #ration_div fp 8
scoreboard players set #housing fp 60
scoreboard players set #eff fp 100
scoreboard players set #workers fp 45
scoreboard players set #hungry fp 0
scoreboard players set #law_cd fp 0

# Здания
scoreboard players set #n_tent fp 0
scoreboard players set #n_house fp 0
scoreboard players set #n_hub fp 0
scoreboard players set #n_hunter fp 0
scoreboard players set #n_mine fp 0
scoreboard players set #n_sawmill fp 0
scoreboard players set #n_foundry fp 0
scoreboard players set #n_medical fp 0
scoreboard players set #n_guard fp 0
scoreboard players set #n_prayer fp 0

# Законы
scoreboard players set #law_soup fp 0
scoreboard players set #law_rations fp 0
scoreboard players set #law_ext fp 0
scoreboard players set #law_em fp 0
scoreboard players set #law_child fp 0
scoreboard players set #law_safe fp 0
scoreboard players set #law_amput fp 0
scoreboard players set #law_radical fp 0
scoreboard players set #law_martial fp 0
scoreboard players set #law_faith fp 0

tag @a remove fp_captain
tag @s add fp_captain
execute rotated ~ 0 positioned ^ ^ ^8 align xyz positioned ~0.5 ~ ~0.5 run function frostpunk:build/place/generator

title @a title {"text":"FROSTPUNK","color":"aqua","bold":true}
title @a subtitle {"text":"Последний город на Земле. Генератор запущен.","color":"gray"}
tellraw @a [{"text":"[Frostpunk] ","color":"aqua"},{"text":"Игра началась. Капитан: ","color":"gray"},{"selector":"@s","color":"gold"}]
tellraw @a [{"text":"Открой меню: ","color":"gray"},{"text":"[МЕНЮ]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger fp_menu set 1"},"hover_event":{"action":"show_text","value":"Или команда: /trigger fp_menu set 1"}}]
