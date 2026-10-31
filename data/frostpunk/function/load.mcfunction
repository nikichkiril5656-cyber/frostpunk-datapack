# Создаём цели (при /reload повторное создание просто даст безвредное сообщение в логе)
scoreboard objectives add fp dummy
scoreboard objectives add fp_local dummy
scoreboard objectives add fp_bonus dummy
scoreboard objectives add fp_menu trigger
function frostpunk:constants
execute unless score #init fp matches 1 run tellraw @a [{"text":"[Frostpunk] ","color":"aqua"},{"text":"Датапак загружен. Оператор, начни игру: ","color":"gray"},{"text":"/function frostpunk:new_game","color":"yellow","click_event":{"action":"suggest_command","command":"/function frostpunk:new_game"}}]
