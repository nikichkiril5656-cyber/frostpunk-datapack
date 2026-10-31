# Макрос. Аргументы: id (1..6), name. Выполняет Капитан.
# Главой становится ближайший игрок в 8 блоках (не Капитан), а если рядом никого нет — сам Капитан.
tag @a remove fp_cand
execute as @p[tag=!fp_captain,distance=..8] run tag @s add fp_cand
execute unless entity @a[tag=fp_cand] run tag @s add fp_cand
# район закреплён за одним человеком, человек — максимум за одним районом
$tag @a[tag=fp_d$(id)] remove fp_d$(id)
tag @a[tag=fp_cand] remove fp_d1
tag @a[tag=fp_cand] remove fp_d2
tag @a[tag=fp_cand] remove fp_d3
tag @a[tag=fp_cand] remove fp_d4
tag @a[tag=fp_cand] remove fp_d5
tag @a[tag=fp_cand] remove fp_d6
$tag @a[tag=fp_cand] add fp_d$(id)
tag @a[tag=fp_cand] add fp_head
$tellraw @a [{"selector":"@a[tag=fp_cand]","color":"green"},{"text":" назначен главой района «$(name)».","color":"yellow"}]
tag @a remove fp_cand
function frostpunk:district/cleanup
