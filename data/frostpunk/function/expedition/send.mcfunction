# Отправка отряда разведчиков (3 человека, 12 игровых часов). Выполняет Капитан.
execute unless score #running fp matches 1 run return run tellraw @s {"text":"Игра не запущена.","color":"red"}
execute if score #scout fp matches 1.. run return run tellraw @s [{"text":"Отряд уже в пути. Вернётся через часов: ","color":"red"},{"score":{"name":"#scout","objective":"fp"},"color":"white"}]
execute unless score #food fp matches 10.. run return run tellraw @s {"text":"Для экспедиции нужно 10 еды и 6 угля.","color":"red"}
execute unless score #coal fp matches 6.. run return run tellraw @s {"text":"Для экспедиции нужно 10 еды и 6 угля.","color":"red"}
execute unless score #workers fp matches 4.. run return run tellraw @s {"text":"Некого отправить: нужно минимум 4 рабочих.","color":"red"}
scoreboard players remove #food fp 10
scoreboard players remove #coal fp 6
scoreboard players set #scout_men fp 3
scoreboard players operation #pop fp -= #scout_men fp
scoreboard players set #scout fp 12
tellraw @a [{"text":"🧭 Отряд из 3 разведчиков ушёл в метель. Возвращения ждём через 12 часов.","color":"aqua"}]
