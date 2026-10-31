# Проверка свободного места под новое здание (в 6 блоках перед игроком).
# Здания занимают 7x7, поэтому другое здание ближе 7 блоков (по осям) мешает.
# Возвращает 1, если место свободно, иначе fail.
execute rotated ~ 0 positioned ^ ^ ^6 positioned ~-6.9 ~-4 ~-6.9 if entity @e[type=marker,tag=fp_building,dx=13.8,dy=8,dz=13.8] run tellraw @s {"text":"Слишком близко к другому зданию. Отойдите на 7+ блоков от соседних построек.","color":"red"}
execute rotated ~ 0 positioned ^ ^ ^6 positioned ~-6.9 ~-4 ~-6.9 if entity @e[type=marker,tag=fp_building,dx=13.8,dy=8,dz=13.8] run return fail
return 1
