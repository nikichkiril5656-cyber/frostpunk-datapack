# Макрос: item (id или #тег), res (счётчик ресурса), mult (множитель)
$execute store result score #t fp run clear @s $(item) 0
$clear @s $(item)
$scoreboard players set #m fp $(mult)
scoreboard players operation #t fp *= #m fp
$scoreboard players operation $(res) fp += #t fp
scoreboard players operation #dep fp += #t fp
