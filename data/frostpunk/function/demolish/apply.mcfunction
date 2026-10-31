# Макрос. Аргументы: type, name, wood, steel (возврат ресурсов)
$scoreboard players remove #n_$(type) fp 1
$scoreboard players add #wood fp $(wood)
$scoreboard players add #steel fp $(steel)
$tellraw @a [{"text":"Снесено: ","color":"gray"},{"text":"$(name)","color":"gold"},{"text":" (возврат: дерево +$(wood), сталь +$(steel))","color":"gray"}]
fill ~-3 ~ ~-3 ~3 ~9 ~3 minecraft:air
kill @s
