# Автогенерация: tools/gen_buildings.py. Не править вручную.
fill ~-3 ~ ~-3 ~3 ~10 ~3 minecraft:air
fill ~-3 ~-5 ~-3 ~3 ~-2 ~3 minecraft:cobblestone keep
fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 minecraft:spruce_planks
fill ~-3 ~ ~-3 ~-3 ~3 ~-3 minecraft:oak_log[axis=y]
fill ~-3 ~ ~ ~-3 ~3 ~ minecraft:oak_log[axis=y]
fill ~-3 ~ ~3 ~-3 ~3 ~3 minecraft:oak_log[axis=y]
fill ~3 ~ ~-3 ~3 ~3 ~-3 minecraft:oak_log[axis=y]
fill ~3 ~ ~ ~3 ~3 ~ minecraft:oak_log[axis=y]
fill ~3 ~ ~3 ~3 ~3 ~3 minecraft:oak_log[axis=y]
fill ~-3 ~3 ~-3 ~-3 ~3 ~3 minecraft:stripped_oak_log[axis=z]
fill ~3 ~3 ~-3 ~3 ~3 ~3 minecraft:stripped_oak_log[axis=z]
fill ~-3 ~3 ~-3 ~3 ~3 ~-3 minecraft:stripped_oak_log[axis=x]
fill ~-3 ~3 ~3 ~3 ~3 ~3 minecraft:stripped_oak_log[axis=x]
fill ~ ~3 ~-3 ~ ~3 ~3 minecraft:oak_planks
fill ~-3 ~4 ~-3 ~-3 ~4 ~3 minecraft:spruce_stairs[facing=east,half=bottom]
fill ~3 ~4 ~-3 ~3 ~4 ~3 minecraft:spruce_stairs[facing=west,half=bottom]
fill ~-2 ~5 ~-3 ~-2 ~5 ~3 minecraft:spruce_stairs[facing=east,half=bottom]
fill ~2 ~5 ~-3 ~2 ~5 ~3 minecraft:spruce_stairs[facing=west,half=bottom]
fill ~-1 ~6 ~-3 ~-1 ~6 ~3 minecraft:spruce_stairs[facing=east,half=bottom]
fill ~1 ~6 ~-3 ~1 ~6 ~3 minecraft:spruce_stairs[facing=west,half=bottom]
fill ~ ~6 ~-3 ~ ~6 ~3 minecraft:spruce_planks
fill ~ ~7 ~-3 ~ ~7 ~3 minecraft:spruce_slab[type=bottom]
setblock ~ ~ ~ minecraft:stonecutter[facing=north]
setblock ~ ~2 ~ minecraft:lantern[hanging=true]
fill ~-2 ~ ~-2 ~-2 ~ ~-1 minecraft:oak_log[axis=z]
setblock ~-2 ~1 ~-2 minecraft:oak_log[axis=z]
fill ~2 ~ ~-2 ~2 ~ ~-1 minecraft:spruce_planks
setblock ~2 ~1 ~-2 minecraft:spruce_planks
setblock ~2 ~ ~2 minecraft:barrel[facing=up]
setblock ~-2 ~ ~2 minecraft:grindstone[face=floor,facing=north]
summon minecraft:marker ~ ~ ~ {Tags:["fp","fp_building","fp_sawmill"]}
