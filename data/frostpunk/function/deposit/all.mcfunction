# Сдача ресурсов на склад (нужно быть рядом с генератором)
execute unless score #running fp matches 1 run return run tellraw @s {"text":"Игра не запущена.","color":"red"}
execute unless entity @e[type=marker,tag=fp_generator,distance=..32] run return run tellraw @s {"text":"Склад находится у генератора. Подойдите ближе (32 блока).","color":"red"}

scoreboard players set #dep fp 0

# Уголь
function frostpunk:deposit/item {item:"minecraft:coal",res:"#coal",mult:1}
function frostpunk:deposit/item {item:"minecraft:charcoal",res:"#coal",mult:1}
function frostpunk:deposit/item {item:"minecraft:coal_block",res:"#coal",mult:9}

# Дерево: брёвна x4, доски x1
function frostpunk:deposit/item {item:"#minecraft:logs",res:"#wood",mult:4}
function frostpunk:deposit/item {item:"#minecraft:planks",res:"#wood",mult:1}

# Сталь
function frostpunk:deposit/item {item:"minecraft:iron_ingot",res:"#steel",mult:1}
function frostpunk:deposit/item {item:"minecraft:iron_block",res:"#steel",mult:9}

# Еда
function frostpunk:deposit/item {item:"minecraft:bread",res:"#food",mult:3}
function frostpunk:deposit/item {item:"minecraft:cooked_beef",res:"#food",mult:6}
function frostpunk:deposit/item {item:"minecraft:cooked_porkchop",res:"#food",mult:6}
function frostpunk:deposit/item {item:"minecraft:cooked_mutton",res:"#food",mult:5}
function frostpunk:deposit/item {item:"minecraft:cooked_chicken",res:"#food",mult:4}
function frostpunk:deposit/item {item:"minecraft:cooked_cod",res:"#food",mult:4}
function frostpunk:deposit/item {item:"minecraft:cooked_salmon",res:"#food",mult:4}
function frostpunk:deposit/item {item:"minecraft:baked_potato",res:"#food",mult:3}
function frostpunk:deposit/item {item:"minecraft:carrot",res:"#food",mult:1}
function frostpunk:deposit/item {item:"minecraft:potato",res:"#food",mult:1}
function frostpunk:deposit/item {item:"minecraft:apple",res:"#food",mult:1}

execute if score #dep fp matches 0 run return run tellraw @s {"text":"У вас нет ничего, что город мог бы принять (уголь, брёвна, доски, железо, готовая еда).","color":"gray"}
tellraw @a [{"selector":"@s","color":"yellow"},{"text":" сдал на склад ресурсов на сумму: ","color":"gray"},{"score":{"name":"#dep","objective":"fp"},"color":"green"}]
