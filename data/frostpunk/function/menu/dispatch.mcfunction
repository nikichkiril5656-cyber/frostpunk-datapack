# Выполняется от имени игрока, нажавшего триггер fp_menu
execute if score @s fp_menu matches 1 run return run function frostpunk:menu/main
execute if score @s fp_menu matches 2 run return run function frostpunk:menu/build
execute if score @s fp_menu matches 3 run return run function frostpunk:menu/laws
execute if score @s fp_menu matches 4 run return run function frostpunk:menu/status
execute if score @s fp_menu matches 5 run return run function frostpunk:deposit/all
execute if score @s fp_menu matches 6 run return run function frostpunk:menu/generator

execute if score @s fp_menu matches 10..49 unless score #running fp matches 1 run return run tellraw @s {"text":"Игра не запущена. Оператор: /function frostpunk:new_game","color":"red"}
execute if score @s fp_menu matches 10..49 unless entity @s[tag=fp_captain] run return run tellraw @s {"text":"Это решение может принять только Капитан (тег fp_captain).","color":"red"}

# Генератор
execute if score @s fp_menu matches 10..13 run return run function frostpunk:gen/set

# Строительство
execute if score @s fp_menu matches 20 run return run function frostpunk:build/do {type:"tent",name:"Палатка",wood:12,steel:0}
execute if score @s fp_menu matches 21 run return run function frostpunk:build/do {type:"house",name:"Дом",wood:28,steel:6}
execute if score @s fp_menu matches 22 run return run function frostpunk:build/do {type:"hub",name:"Паровой узел",wood:10,steel:12}
execute if score @s fp_menu matches 23 run return run function frostpunk:build/do {type:"hunter",name:"Хижина охотника",wood:18,steel:0}
execute if score @s fp_menu matches 24 run return run function frostpunk:build/do {type:"mine",name:"Угольная шахта",wood:26,steel:8}
execute if score @s fp_menu matches 25 run return run function frostpunk:build/do {type:"sawmill",name:"Лесопилка",wood:14,steel:0}
execute if score @s fp_menu matches 26 run return run function frostpunk:build/do {type:"foundry",name:"Сталелитейная",wood:40,steel:20}
execute if score @s fp_menu matches 27 run return run function frostpunk:build/do {type:"medical",name:"Медпункт",wood:26,steel:8}
execute if score @s fp_menu matches 28 run return run function frostpunk:build/do {type:"guard",name:"Караульная",wood:20,steel:10}
execute if score @s fp_menu matches 29 run return run function frostpunk:build/do {type:"prayer",name:"Молельный дом",wood:30,steel:10}

# Снос и разведка
execute if score @s fp_menu matches 40 run return run function frostpunk:demolish/nearest
execute if score @s fp_menu matches 41 run return run function frostpunk:expedition/send

# Законы
execute if score @s fp_menu matches 30 run return run function frostpunk:law/soup
execute if score @s fp_menu matches 31 run return run function frostpunk:law/rations
execute if score @s fp_menu matches 32 run return run function frostpunk:law/ext
execute if score @s fp_menu matches 33 run return run function frostpunk:law/em
execute if score @s fp_menu matches 34 run return run function frostpunk:law/child
execute if score @s fp_menu matches 35 run return run function frostpunk:law/safe
execute if score @s fp_menu matches 36 run return run function frostpunk:law/amput
execute if score @s fp_menu matches 37 run return run function frostpunk:law/radical
execute if score @s fp_menu matches 38 run return run function frostpunk:law/martial
execute if score @s fp_menu matches 39 run return run function frostpunk:law/faith
