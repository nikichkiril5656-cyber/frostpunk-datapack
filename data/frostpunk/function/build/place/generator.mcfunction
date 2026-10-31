# Автогенерация: tools/gen_buildings.py. Не править вручную.
fill ~-3 ~ ~-3 ~3 ~14 ~3 minecraft:air
fill ~-3 ~-5 ~-3 ~3 ~-2 ~3 minecraft:cobblestone keep
fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 minecraft:polished_blackstone_bricks
fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:iron_block
setblock ~-3 ~-1 ~-3 minecraft:chiseled_polished_blackstone
setblock ~-3 ~ ~-3 minecraft:stone_brick_wall
setblock ~-3 ~1 ~-3 minecraft:lantern
setblock ~-3 ~-1 ~3 minecraft:chiseled_polished_blackstone
setblock ~-3 ~ ~3 minecraft:stone_brick_wall
setblock ~-3 ~1 ~3 minecraft:lantern
setblock ~3 ~-1 ~-3 minecraft:chiseled_polished_blackstone
setblock ~3 ~ ~-3 minecraft:stone_brick_wall
setblock ~3 ~1 ~-3 minecraft:lantern
setblock ~3 ~-1 ~3 minecraft:chiseled_polished_blackstone
setblock ~3 ~ ~3 minecraft:stone_brick_wall
setblock ~3 ~1 ~3 minecraft:lantern
fill ~-1 ~ ~-1 ~1 ~ ~1 minecraft:iron_block
fill ~-1 ~1 ~-1 ~1 ~4 ~1 minecraft:copper_block
fill ~-1 ~5 ~-1 ~1 ~5 ~1 minecraft:iron_block
fill ~ ~6 ~ ~ ~11 ~ minecraft:blackstone
setblock ~ ~12 ~ minecraft:hay_block
setblock ~ ~13 ~ minecraft:campfire[lit=true,signal_fire=true]
setblock ~-2 ~1 ~ minecraft:iron_block
setblock ~-2 ~2 ~ minecraft:glowstone
setblock ~-2 ~3 ~ minecraft:coal_block
setblock ~-2 ~4 ~ minecraft:coal_block
setblock ~-2 ~5 ~ minecraft:iron_block
setblock ~ ~3 ~-2 minecraft:lightning_rod[facing=north]
setblock ~ ~3 ~2 minecraft:lightning_rod[facing=south]
setblock ~2 ~3 ~ minecraft:lightning_rod[facing=east]
setblock ~ ~3 ~-3 minecraft:lightning_rod[facing=north]
setblock ~ ~3 ~3 minecraft:lightning_rod[facing=south]
setblock ~3 ~3 ~ minecraft:lightning_rod[facing=east]
fill ~2 ~ ~-2 ~3 ~ ~-2 minecraft:coal_block
setblock ~3 ~ ~-1 minecraft:coal_block
setblock ~2 ~1 ~-2 minecraft:coal_block
setblock ~-2 ~ ~2 minecraft:blast_furnace[facing=east,lit=true]
setblock ~2 ~ ~2 minecraft:blast_furnace[facing=west,lit=true]
setblock ~-2 ~ ~-2 minecraft:barrel[facing=up]
summon minecraft:marker ~ ~ ~ {Tags:["fp","fp_building","fp_generator"]}
