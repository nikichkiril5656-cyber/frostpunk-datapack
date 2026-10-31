# Автогенерация: tools/gen_buildings.py. Не править вручную.
fill ~3 ~ ~3 ~-3 ~10 ~-3 minecraft:air
fill ~3 ~-5 ~3 ~-3 ~-2 ~-3 minecraft:cobblestone keep
fill ~3 ~-1 ~3 ~-3 ~-1 ~-3 minecraft:stone_bricks
fill ~2 ~-1 ~2 ~-2 ~-1 ~-2 minecraft:polished_blackstone_bricks
setblock ~3 ~ ~3 minecraft:stone_brick_wall
setblock ~3 ~1 ~3 minecraft:lantern
setblock ~3 ~ ~-3 minecraft:stone_brick_wall
setblock ~3 ~1 ~-3 minecraft:lantern
setblock ~-3 ~ ~3 minecraft:stone_brick_wall
setblock ~-3 ~1 ~3 minecraft:lantern
setblock ~-3 ~ ~-3 minecraft:stone_brick_wall
setblock ~-3 ~1 ~-3 minecraft:lantern
fill ~1 ~ ~1 ~-1 ~ ~-1 minecraft:iron_block
fill ~1 ~1 ~1 ~-1 ~2 ~-1 minecraft:copper_block
fill ~1 ~3 ~1 ~-1 ~3 ~-1 minecraft:iron_block
setblock ~ ~2 ~1 minecraft:glass
fill ~ ~4 ~ ~ ~7 ~ minecraft:copper_block
setblock ~ ~8 ~ minecraft:hay_block
setblock ~ ~9 ~ minecraft:campfire[lit=true,signal_fire=true]
setblock ~-2 ~1 ~ minecraft:lightning_rod[facing=west]
setblock ~2 ~1 ~ minecraft:lightning_rod[facing=east]
setblock ~ ~1 ~-2 minecraft:lightning_rod[facing=north]
setblock ~ ~1 ~2 minecraft:lightning_rod[facing=south]
setblock ~-3 ~1 ~ minecraft:lightning_rod[facing=west]
setblock ~3 ~1 ~ minecraft:lightning_rod[facing=east]
setblock ~ ~1 ~-3 minecraft:lightning_rod[facing=north]
setblock ~ ~1 ~3 minecraft:lightning_rod[facing=south]
summon minecraft:marker ~ ~ ~ {Tags:["fp","fp_building","fp_hub"]}
