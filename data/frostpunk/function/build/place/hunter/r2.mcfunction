# Автогенерация: tools/gen_buildings.py. Не править вручную.
fill ~3 ~ ~3 ~-3 ~10 ~-3 minecraft:air
fill ~3 ~-5 ~3 ~-3 ~-2 ~-3 minecraft:cobblestone keep
fill ~3 ~-1 ~3 ~-3 ~-1 ~-3 minecraft:coarse_dirt
fill ~2 ~-1 ~2 ~-2 ~-1 ~-2 minecraft:spruce_planks
fill ~2 ~ ~2 ~-2 ~2 ~-2 minecraft:spruce_planks
fill ~1 ~ ~1 ~-1 ~2 ~-1 minecraft:air
fill ~2 ~ ~2 ~2 ~2 ~2 minecraft:spruce_log[axis=y]
fill ~2 ~ ~-2 ~2 ~2 ~-2 minecraft:spruce_log[axis=y]
fill ~-2 ~ ~2 ~-2 ~2 ~2 minecraft:spruce_log[axis=y]
fill ~-2 ~ ~-2 ~-2 ~2 ~-2 minecraft:spruce_log[axis=y]
setblock ~ ~ ~2 minecraft:dark_oak_door[facing=south,half=lower]
setblock ~ ~1 ~2 minecraft:dark_oak_door[facing=south,half=upper]
setblock ~2 ~1 ~ minecraft:glass_pane
setblock ~-2 ~1 ~ minecraft:glass_pane
setblock ~ ~1 ~-2 minecraft:glass_pane
fill ~2 ~3 ~2 ~2 ~3 ~-2 minecraft:dark_oak_stairs[facing=west,half=bottom]
fill ~-2 ~3 ~2 ~-2 ~3 ~-2 minecraft:dark_oak_stairs[facing=east,half=bottom]
fill ~1 ~4 ~2 ~1 ~4 ~-2 minecraft:dark_oak_stairs[facing=west,half=bottom]
fill ~-1 ~4 ~2 ~-1 ~4 ~-2 minecraft:dark_oak_stairs[facing=east,half=bottom]
fill ~ ~4 ~2 ~ ~4 ~-2 minecraft:dark_oak_planks
fill ~ ~5 ~2 ~ ~5 ~-2 minecraft:dark_oak_slab[type=bottom]
fill ~1 ~3 ~2 ~-1 ~3 ~2 minecraft:spruce_planks
fill ~1 ~3 ~-2 ~-1 ~3 ~-2 minecraft:spruce_planks
fill ~ ~4 ~2 ~ ~4 ~2 minecraft:spruce_planks
fill ~ ~4 ~-2 ~ ~4 ~-2 minecraft:spruce_planks
setblock ~1 ~ ~1 minecraft:brown_bed[facing=north,part=foot]
setblock ~1 ~ ~ minecraft:brown_bed[facing=north,part=head]
setblock ~-1 ~ ~-1 minecraft:smoker[facing=south,lit=true]
setblock ~1 ~ ~-1 minecraft:barrel[facing=up]
setblock ~1 ~1 ~-1 minecraft:lantern
fill ~-3 ~ ~1 ~-3 ~2 ~1 minecraft:spruce_fence
fill ~-3 ~ ~-1 ~-3 ~2 ~-1 minecraft:spruce_fence
setblock ~-3 ~2 ~ minecraft:spruce_fence
setblock ~-3 ~1 ~ minecraft:brown_wool
fill ~3 ~ ~1 ~3 ~ ~-1 minecraft:oak_log[axis=z]
setblock ~3 ~1 ~ minecraft:oak_log[axis=z]
setblock ~2 ~ ~3 minecraft:campfire[lit=true]
summon minecraft:marker ~ ~ ~ {Tags:["fp","fp_building","fp_hunter","fp_shelter"]}
