# Автогенерация: tools/gen_buildings.py. Не править вручную.
fill ~3 ~ ~-3 ~-3 ~11 ~3 minecraft:air
fill ~3 ~-5 ~-3 ~-3 ~-2 ~3 minecraft:cobblestone keep
fill ~3 ~-1 ~-3 ~-3 ~-1 ~3 minecraft:cobblestone
fill ~2 ~-1 ~-2 ~-2 ~-1 ~2 minecraft:spruce_planks
fill ~3 ~ ~-3 ~-3 ~3 ~3 minecraft:spruce_planks
fill ~2 ~ ~-2 ~-2 ~3 ~2 minecraft:air
fill ~3 ~ ~-3 ~-3 ~ ~3 minecraft:cobblestone
fill ~2 ~ ~-2 ~-2 ~ ~2 minecraft:air
fill ~3 ~ ~-3 ~3 ~3 ~-3 minecraft:stripped_spruce_log[axis=y]
fill ~-3 ~ ~-3 ~-3 ~3 ~-3 minecraft:stripped_spruce_log[axis=y]
fill ~3 ~ ~3 ~3 ~3 ~3 minecraft:stripped_spruce_log[axis=y]
fill ~-3 ~ ~3 ~-3 ~3 ~3 minecraft:stripped_spruce_log[axis=y]
fill ~ ~1 ~-3 ~ ~3 ~-3 minecraft:spruce_log[axis=y]
fill ~ ~1 ~3 ~ ~3 ~3 minecraft:spruce_log[axis=y]
fill ~-3 ~1 ~ ~-3 ~3 ~ minecraft:spruce_log[axis=y]
setblock ~3 ~ ~ minecraft:spruce_door[facing=east,half=lower]
setblock ~3 ~1 ~ minecraft:spruce_door[facing=east,half=upper]
setblock ~1 ~1 ~-3 minecraft:glass_pane
setblock ~1 ~1 ~3 minecraft:glass_pane
setblock ~-1 ~1 ~-3 minecraft:glass_pane
setblock ~-1 ~1 ~3 minecraft:glass_pane
setblock ~-3 ~1 ~-1 minecraft:glass_pane
setblock ~-3 ~1 ~1 minecraft:glass_pane
setblock ~3 ~2 ~-1 minecraft:glass_pane
setblock ~3 ~2 ~1 minecraft:glass_pane
fill ~3 ~4 ~-3 ~-3 ~4 ~-3 minecraft:spruce_stairs[facing=south,half=bottom]
fill ~3 ~4 ~3 ~-3 ~4 ~3 minecraft:spruce_stairs[facing=north,half=bottom]
fill ~3 ~5 ~-2 ~-3 ~5 ~-2 minecraft:spruce_stairs[facing=south,half=bottom]
fill ~3 ~5 ~2 ~-3 ~5 ~2 minecraft:spruce_stairs[facing=north,half=bottom]
fill ~3 ~6 ~-1 ~-3 ~6 ~-1 minecraft:spruce_stairs[facing=south,half=bottom]
fill ~3 ~6 ~1 ~-3 ~6 ~1 minecraft:spruce_stairs[facing=north,half=bottom]
fill ~3 ~6 ~ ~-3 ~6 ~ minecraft:spruce_planks
fill ~3 ~7 ~ ~-3 ~7 ~ minecraft:spruce_slab[type=bottom]
fill ~3 ~4 ~-2 ~3 ~4 ~2 minecraft:spruce_planks
fill ~-3 ~4 ~-2 ~-3 ~4 ~2 minecraft:spruce_planks
fill ~3 ~5 ~-1 ~3 ~5 ~1 minecraft:spruce_planks
fill ~-3 ~5 ~-1 ~-3 ~5 ~1 minecraft:spruce_planks
fill ~3 ~6 ~ ~3 ~6 ~ minecraft:spruce_planks
fill ~-3 ~6 ~ ~-3 ~6 ~ minecraft:spruce_planks
setblock ~-2 ~ ~2 minecraft:furnace[facing=east,lit=true]
fill ~-2 ~1 ~2 ~-2 ~7 ~2 minecraft:bricks
setblock ~-2 ~8 ~2 minecraft:campfire[lit=true]
setblock ~ ~ ~-2 minecraft:red_bed[facing=west,part=foot]
setblock ~-1 ~ ~-2 minecraft:red_bed[facing=west,part=head]
setblock ~2 ~ ~-2 minecraft:crafting_table
setblock ~2 ~1 ~-2 minecraft:lantern
setblock ~-2 ~ ~-2 minecraft:barrel[facing=up]
summon minecraft:marker ~ ~ ~ {Tags:["fp","fp_building","fp_house","fp_shelter"]}
