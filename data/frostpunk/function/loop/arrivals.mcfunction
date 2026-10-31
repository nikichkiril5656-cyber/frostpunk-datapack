execute store result score #arr fp run random value 6..16
scoreboard players operation #pop fp += #arr fp
scoreboard players operation #t fp = #arr fp
scoreboard players operation #t fp /= #c3 fp
scoreboard players operation #children fp += #t fp
tellraw @a [{"text":"К городу пришли беженцы: ","color":"yellow"},{"score":{"name":"#arr","objective":"fp"},"color":"white"},{"text":" чел. Им нужны дома и еда.","color":"yellow"}]
