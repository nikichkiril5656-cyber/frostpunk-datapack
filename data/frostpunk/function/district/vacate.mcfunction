# Макрос. Аргументы: id (1..6), name. Выполняет Капитан.
$execute unless entity @a[tag=fp_d$(id)] run return run tellraw @s {"text":"У района «$(name)» нет главы (или он не в сети).","color":"red"}
$tellraw @a [{"selector":"@a[tag=fp_d$(id)]","color":"green"},{"text":" снят с должности главы района «$(name)».","color":"yellow"}]
$tag @a[tag=fp_d$(id)] remove fp_d$(id)
function frostpunk:district/cleanup
