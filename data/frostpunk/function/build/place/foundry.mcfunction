fill ~-3 ~ ~-3 ~3 ~7 ~3 minecraft:air
fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 minecraft:polished_blackstone_bricks
fill ~-3 ~ ~-3 ~3 ~4 ~3 minecraft:bricks hollow
fill ~-1 ~1 ~-3 ~1 ~3 ~-3 minecraft:air
setblock ~-1 ~1 ~2 minecraft:blast_furnace[facing=north]
setblock ~1 ~1 ~2 minecraft:blast_furnace[facing=north]
setblock ~ ~1 ~ minecraft:anvil
setblock ~-2 ~1 ~ minecraft:iron_block
setblock ~2 ~1 ~ minecraft:iron_block
fill ~2 ~5 ~2 ~2 ~8 ~2 minecraft:bricks
summon minecraft:marker ~ ~ ~ {Tags:["fp","fp_building","fp_foundry","fp_shelter"]}
