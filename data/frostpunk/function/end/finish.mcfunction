# Макрос завершения игры. Аргументы: title, sub, color
scoreboard players set #running fp 0
$title @a title {"text":"$(title)","color":"$(color)","bold":true}
$title @a subtitle {"text":"$(sub)","color":"gray"}
tellraw @a [{"text":"══ Итог ══ ","color":"gold"},{"text":"День ","color":"gray"},{"score":{"name":"#day","objective":"fp"},"color":"white"},{"text":", жителей: ","color":"gray"},{"score":{"name":"#pop","objective":"fp"},"color":"white"},{"text":", погибло всего: ","color":"gray"},{"score":{"name":"#dead_total","objective":"fp"},"color":"red"}]
tellraw @a [{"text":"Новая игра: ","color":"gray"},{"text":"/function frostpunk:new_game","color":"yellow","click_event":{"action":"suggest_command","command":"/function frostpunk:new_game"}}]
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 0.6 0.8
