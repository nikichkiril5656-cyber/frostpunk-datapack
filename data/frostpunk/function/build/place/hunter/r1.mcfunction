# Автогенерация: tools/gen_buildings.py. Не править вручную.
fill ~3 ~ ~-3 ~-3 ~10 ~3 minecraft:air
fill ~3 ~-5 ~-3 ~-3 ~-2 ~3 minecraft:cobblestone keep
fill ~3 ~-1 ~-3 ~-3 ~-1 ~3 minecraft:coarse_dirt
fill ~2 ~-1 ~-2 ~-2 ~-1 ~2 minecraft:spruce_planks
fill ~2 ~ ~-2 ~-2 ~2 ~2 minecraft:spruce_planks
fill ~1 ~ ~-1 ~-1 ~2 ~1 minecraft:air
fill ~2 ~ ~-2 ~2 ~2 ~-2 minecraft:spruce_log[axis=y]
fill ~-2 ~ ~-2 ~-2 ~2 ~-2 minecraft:spruce_log[axis=y]
fill ~2 ~ ~2 ~2 ~2 ~2 minecraft:spruce_log[axis=y]
fill ~-2 ~ ~2 ~-2 ~2 ~2 minecraft:spruce_log[axis=y]
setblock ~2 ~ ~ minecraft:dark_oak_door[facing=east,half=lower]
setblock ~2 ~1 ~ minecraft:dark_oak_door[facing=east,half=upper]
setblock ~ ~1 ~-2 minecraft:glass_pane
setblock ~ ~1 ~2 minecraft:glass_pane
setblock ~-2 ~1 ~ minecraft:glass_pane
fill ~2 ~3 ~-2 ~-2 ~3 ~-2 minecraft:dark_oak_stairs[facing=south,half=bottom]
fill ~2 ~3 ~2 ~-2 ~3 ~2 minecraft:dark_oak_stairs[facing=north,half=bottom]
fill ~2 ~4 ~-1 ~-2 ~4 ~-1 minecraft:dark_oak_stairs[facing=south,half=bottom]
fill ~2 ~4 ~1 ~-2 ~4 ~1 minecraft:dark_oak_stairs[facing=north,half=bottom]
fill ~2 ~4 ~ ~-2 ~4 ~ minecraft:dark_oak_planks
fill ~2 ~5 ~ ~-2 ~5 ~ minecraft:dark_oak_slab[type=bottom]
fill ~2 ~3 ~-1 ~2 ~3 ~1 minecraft:spruce_planks
fill ~-2 ~3 ~-1 ~-2 ~3 ~1 minecraft:spruce_planks
fill ~2 ~4 ~ ~2 ~4 ~ minecraft:spruce_planks
fill ~-2 ~4 ~ ~-2 ~4 ~ minecraft:spruce_planks
setblock ~1 ~ ~-1 minecraft:brown_bed[facing=west,part=foot]
setblock ~ ~ ~-1 minecraft:brown_bed[facing=west,part=head]
setblock ~-1 ~ ~1 minecraft:smoker[facing=east,lit=true]
setblock ~-1 ~ ~-1 minecraft:barrel[facing=up]
setblock ~-1 ~1 ~-1 minecraft:lantern
fill ~1 ~ ~3 ~1 ~2 ~3 minecraft:spruce_fence
fill ~-1 ~ ~3 ~-1 ~2 ~3 minecraft:spruce_fence
setblock ~ ~2 ~3 minecraft:spruce_fence
setblock ~ ~1 ~3 minecraft:brown_wool
fill ~1 ~ ~-3 ~-1 ~ ~-3 minecraft:oak_log[axis=x]
setblock ~ ~1 ~-3 minecraft:oak_log[axis=x]
setblock ~3 ~ ~-2 minecraft:campfire[lit=true]
summon minecraft:marker ~ ~ ~ {Tags:["fp","fp_building","fp_hunter","fp_shelter"]}
