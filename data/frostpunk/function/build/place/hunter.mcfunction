fill ~-3 ~ ~-3 ~3 ~7 ~3 minecraft:air
fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:spruce_planks
fill ~-2 ~ ~-2 ~2 ~3 ~2 minecraft:dark_oak_planks hollow
fill ~ ~1 ~-2 ~ ~2 ~-2 minecraft:air
setblock ~ ~1 ~1 minecraft:smoker[facing=north]
setblock ~-1 ~1 ~1 minecraft:barrel[facing=up]
setblock ~1 ~1 ~1 minecraft:lantern
fill ~-2 ~4 ~-2 ~2 ~4 ~2 minecraft:dark_oak_slab
summon minecraft:marker ~ ~ ~ {Tags:["fp","fp_building","fp_hunter","fp_shelter"]}
