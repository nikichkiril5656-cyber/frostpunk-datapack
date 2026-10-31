# Автогенерация: tools/gen_buildings.py. Не править вручную.
fill ~-3 ~ ~-3 ~3 ~12 ~3 minecraft:air
fill ~-3 ~-5 ~-3 ~3 ~-2 ~3 minecraft:cobblestone keep
fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 minecraft:polished_blackstone_bricks
fill ~-3 ~ ~-3 ~3 ~3 ~3 minecraft:bricks
fill ~-2 ~ ~-2 ~2 ~3 ~2 minecraft:air
fill ~-3 ~ ~-3 ~-3 ~3 ~-3 minecraft:stone_bricks
fill ~-3 ~ ~3 ~-3 ~3 ~3 minecraft:stone_bricks
fill ~3 ~ ~-3 ~3 ~3 ~-3 minecraft:stone_bricks
fill ~3 ~ ~3 ~3 ~3 ~3 minecraft:stone_bricks
setblock ~ ~ ~-3 minecraft:dark_oak_door[facing=north,half=lower]
setblock ~ ~1 ~-3 minecraft:dark_oak_door[facing=north,half=upper]
setblock ~-3 ~1 ~-1 minecraft:iron_bars
setblock ~3 ~1 ~-1 minecraft:iron_bars
setblock ~-3 ~2 ~-1 minecraft:iron_bars
setblock ~3 ~2 ~-1 minecraft:iron_bars
setblock ~-3 ~1 ~1 minecraft:iron_bars
setblock ~3 ~1 ~1 minecraft:iron_bars
setblock ~-3 ~2 ~1 minecraft:iron_bars
setblock ~3 ~2 ~1 minecraft:iron_bars
fill ~-3 ~4 ~-3 ~3 ~4 ~3 minecraft:stone_brick_slab[type=bottom]
fill ~-3 ~5 ~-3 ~3 ~5 ~-3 minecraft:stone_brick_wall
fill ~-3 ~5 ~3 ~3 ~5 ~3 minecraft:stone_brick_wall
fill ~-3 ~5 ~-3 ~-3 ~5 ~3 minecraft:stone_brick_wall
fill ~3 ~5 ~-3 ~3 ~5 ~3 minecraft:stone_brick_wall
setblock ~-2 ~ ~2 minecraft:blast_furnace[facing=north,lit=true]
setblock ~ ~ ~2 minecraft:blast_furnace[facing=north,lit=true]
setblock ~2 ~ ~2 minecraft:furnace[facing=north,lit=true]
fill ~2 ~1 ~2 ~2 ~9 ~2 minecraft:bricks
setblock ~2 ~10 ~2 minecraft:hay_block
setblock ~2 ~11 ~2 minecraft:campfire[lit=true,signal_fire=true]
setblock ~-1 ~ ~-1 minecraft:anvil[facing=east]
setblock ~1 ~ ~-1 minecraft:smithing_table
setblock ~-2 ~ ~ minecraft:iron_block
setblock ~2 ~ ~ minecraft:lava_cauldron
setblock ~ ~3 ~ minecraft:lantern[hanging=true]
summon minecraft:marker ~ ~ ~ {Tags:["fp","fp_building","fp_foundry","fp_shelter"]}
