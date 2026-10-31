# Макрос: производство одного типа здания за час.
# Аргументы: n (счётчик зданий), res (ресурс), base (выработка одного здания)
$scoreboard players operation #t fp = $(n) fp
$scoreboard players set #m fp $(base)
scoreboard players operation #t fp *= #m fp
scoreboard players operation #t fp *= #mult fp
scoreboard players operation #t fp *= #eff fp
scoreboard players operation #t fp /= #c10000 fp
$scoreboard players operation $(res) fp += #t fp
