scoreboard players operation #t fp = #dead fp
scoreboard players operation #t fp *= #children fp
scoreboard players operation #t fp /= #pop fp
scoreboard players operation #children fp -= #t fp
scoreboard players operation #pop fp -= #dead fp
scoreboard players operation #dead_total fp += #dead fp
scoreboard players operation #sick fp -= #dead fp
scoreboard players operation #sick fp > #c0 fp
tellraw @a [{"text":"☠ Погибло жителей: ","color":"dark_red"},{"score":{"name":"#dead","objective":"fp"},"color":"red"}]
