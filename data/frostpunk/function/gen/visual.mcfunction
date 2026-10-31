# Выполняется на маркере генератора: три «лампы» показывают активный уровень
setblock ~-2 ~2 ~ minecraft:coal_block
setblock ~-2 ~3 ~ minecraft:coal_block
setblock ~-2 ~4 ~ minecraft:coal_block
execute if score #gen_active fp matches 1.. run setblock ~-2 ~2 ~ minecraft:glowstone
execute if score #gen_active fp matches 2.. run setblock ~-2 ~3 ~ minecraft:glowstone
execute if score #gen_active fp matches 3.. run setblock ~-2 ~4 ~ minecraft:glowstone
