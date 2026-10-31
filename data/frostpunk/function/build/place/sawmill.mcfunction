fill ~-3 ~ ~-3 ~3 ~7 ~3 minecraft:air
fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 minecraft:spruce_planks
fill ~-3 ~ ~-3 ~-3 ~3 ~-3 minecraft:oak_log
fill ~3 ~ ~-3 ~3 ~3 ~-3 minecraft:oak_log
fill ~-3 ~ ~3 ~-3 ~3 ~3 minecraft:oak_log
fill ~3 ~ ~3 ~3 ~3 ~3 minecraft:oak_log
fill ~-3 ~4 ~-3 ~3 ~4 ~3 minecraft:oak_slab
setblock ~ ~ ~ minecraft:stonecutter[facing=north]
setblock ~-2 ~ ~ minecraft:oak_log[axis=x]
setblock ~-2 ~1 ~ minecraft:oak_log[axis=x]
setblock ~2 ~ ~ minecraft:oak_log[axis=x]
setblock ~2 ~1 ~ minecraft:oak_log[axis=x]
setblock ~ ~3 ~ minecraft:lantern[hanging=true]
summon minecraft:marker ~ ~ ~ {Tags:["fp","fp_building","fp_sawmill"]}
