# Автогенерация: tools/gen_buildings.py. Не править вручную.
fill ~3 ~ ~3 ~-3 ~8 ~-3 minecraft:air
fill ~3 ~-5 ~3 ~-3 ~-2 ~-3 minecraft:cobblestone keep
fill ~3 ~-1 ~3 ~-3 ~-1 ~-3 minecraft:gravel
fill ~3 ~ ~1 ~-3 ~ ~-3 minecraft:stone
fill ~2 ~1 ~ ~-2 ~1 ~-3 minecraft:andesite
fill ~1 ~2 ~-1 ~-1 ~2 ~-3 minecraft:stone
fill ~ ~3 ~-2 ~ ~3 ~-3 minecraft:cobblestone
fill ~ ~ ~1 ~ ~1 ~-2 minecraft:air
fill ~1 ~ ~1 ~1 ~1 ~1 minecraft:dark_oak_log[axis=y]
fill ~-1 ~ ~1 ~-1 ~1 ~1 minecraft:dark_oak_log[axis=y]
fill ~1 ~2 ~1 ~-1 ~2 ~1 minecraft:dark_oak_log[axis=x]
fill ~ ~ ~3 ~ ~ ~-2 minecraft:rail[shape=north_south]
setblock ~1 ~3 ~1 minecraft:lantern
setblock ~-1 ~3 ~1 minecraft:lantern
fill ~2 ~ ~3 ~2 ~3 ~3 minecraft:dark_oak_fence
fill ~-2 ~ ~3 ~-2 ~3 ~3 minecraft:dark_oak_fence
fill ~2 ~4 ~3 ~-2 ~4 ~3 minecraft:dark_oak_planks
setblock ~ ~3 ~3 minecraft:lantern[hanging=true]
fill ~-2 ~ ~2 ~-3 ~ ~2 minecraft:coal_block
setblock ~-3 ~ ~1 minecraft:coal_block
setblock ~-3 ~1 ~2 minecraft:coal_block
setblock ~2 ~ ~2 minecraft:barrel[facing=up]
setblock ~3 ~ ~2 minecraft:cauldron
summon minecraft:marker ~ ~ ~ {Tags:["fp","fp_building","fp_mine","fp_shelter"]}
