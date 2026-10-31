scoreboard players set #hour fp 0
scoreboard players add #day fp 1

# Победа: город дожил до нужного дня
execute if score #day fp >= #victory_day fp run return run function frostpunk:end/finish {title:"ПОБЕДА",sub:"Город пережил холод. Люди будут жить.",color:"green"}

tellraw @a [{"text":"══ День ","color":"gold"},{"score":{"name":"#day","objective":"fp"},"color":"gold"},{"text":" ══","color":"gold"}]

# Базовая температура улицы падает с каждым днём: -22, -24, ... до -75
scoreboard players operation #out_base fp = #day fp
scoreboard players operation #out_base fp *= #cm2 fp
scoreboard players remove #out_base fp 20
scoreboard players operation #out_base fp > #cm75 fp

# Великая буря: дни 24-27
scoreboard players set #storm fp 0
execute if score #day fp matches 24..27 run scoreboard players set #storm fp 1
execute if score #day fp matches 22 run tellraw @a [{"text":"⚠ Метеорологи: через два дня придёт Великая буря. Заправьте генератор и согрейте людей!","color":"red"}]
execute if score #day fp matches 24 run title @a title {"text":"ВЕЛИКАЯ БУРЯ","color":"dark_red","bold":true}
execute if score #day fp matches 24 run title @a subtitle {"text":"Температура упала ещё на 40 градусов","color":"gray"}
execute if score #day fp matches 24 run playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 0.4 0.6
execute if score #day fp matches 28 run tellraw @a [{"text":"Буря стихла. Город выстоял.","color":"aqua"}]

# Случайный холодный день (1 из 6)
scoreboard players set #event_cold fp 0
execute store result score #t fp run random value 1..6
execute if score #t fp matches 1 run scoreboard players set #event_cold fp 1
execute if score #event_cold fp matches 1 run tellraw @a [{"text":"❄ Сегодня особенно морозно: на улице ещё на 10 градусов холоднее.","color":"aqua"}]

# Беженцы приходят каждые 2 дня, если люди ещё надеются
scoreboard players operation #t fp = #day fp
scoreboard players operation #t fp %= #c2 fp
execute if score #t fp matches 0 if score #hope fp matches 25.. run function frostpunk:loop/arrivals
