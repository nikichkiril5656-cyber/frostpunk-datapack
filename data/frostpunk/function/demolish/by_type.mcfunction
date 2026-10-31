# Выполняется на маркере здания. Возврат: половина стоимости строительства (с округлением вниз).
execute if entity @s[tag=fp_tent] run return run function frostpunk:demolish/apply {type:"tent",name:"Палатка",wood:6,steel:0}
execute if entity @s[tag=fp_house] run return run function frostpunk:demolish/apply {type:"house",name:"Дом",wood:14,steel:3}
execute if entity @s[tag=fp_hub] run return run function frostpunk:demolish/apply {type:"hub",name:"Паровой узел",wood:5,steel:6}
execute if entity @s[tag=fp_hunter] run return run function frostpunk:demolish/apply {type:"hunter",name:"Хижина охотника",wood:9,steel:0}
execute if entity @s[tag=fp_mine] run return run function frostpunk:demolish/apply {type:"mine",name:"Угольная шахта",wood:13,steel:4}
execute if entity @s[tag=fp_sawmill] run return run function frostpunk:demolish/apply {type:"sawmill",name:"Лесопилка",wood:7,steel:0}
execute if entity @s[tag=fp_foundry] run return run function frostpunk:demolish/apply {type:"foundry",name:"Сталелитейная",wood:20,steel:10}
execute if entity @s[tag=fp_medical] run return run function frostpunk:demolish/apply {type:"medical",name:"Медпункт",wood:13,steel:4}
execute if entity @s[tag=fp_guard] run return run function frostpunk:demolish/apply {type:"guard",name:"Караульная",wood:10,steel:5}
execute if entity @s[tag=fp_prayer] run return run function frostpunk:demolish/apply {type:"prayer",name:"Молельный дом",wood:15,steel:5}
