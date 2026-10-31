execute store result score #a fp run random value 10..25
execute store result score #b fp run random value 8..20
scoreboard players operation #food fp += #a fp
scoreboard players operation #wood fp += #b fp
tellraw @a [{"text":"🧭 Разведчики нашли заброшенный склад: еда +","color":"green"},{"score":{"name":"#a","objective":"fp"},"color":"white"},{"text":", дерево +","color":"green"},{"score":{"name":"#b","objective":"fp"},"color":"white"}]
