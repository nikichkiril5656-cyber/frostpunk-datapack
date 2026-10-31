# Автогенерация: tools/gen_buildings.py. Не править вручную.
fill ~-3 ~ ~-3 ~3 ~10 ~3 minecraft:air
fill ~-3 ~-5 ~-3 ~3 ~-2 ~3 minecraft:cobblestone keep
fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 minecraft:quartz_block
fill ~-3 ~ ~-3 ~3 ~4 ~3 minecraft:white_concrete
fill ~-2 ~ ~-2 ~2 ~4 ~2 minecraft:air
setblock ~ ~3 ~-3 minecraft:red_concrete
setblock ~-1 ~3 ~-3 minecraft:red_concrete
setblock ~1 ~3 ~-3 minecraft:red_concrete
setblock ~ ~2 ~-3 minecraft:red_concrete
setblock ~ ~4 ~-3 minecraft:red_concrete
setblock ~ ~ ~-3 minecraft:birch_door[facing=north,half=lower]
setblock ~ ~1 ~-3 minecraft:birch_door[facing=north,half=upper]
setblock ~-3 ~1 ~-1 minecraft:glass_pane
setblock ~3 ~1 ~-1 minecraft:glass_pane
setblock ~-3 ~2 ~-1 minecraft:glass_pane
setblock ~3 ~2 ~-1 minecraft:glass_pane
setblock ~-3 ~1 ~1 minecraft:glass_pane
setblock ~3 ~1 ~1 minecraft:glass_pane
setblock ~-3 ~2 ~1 minecraft:glass_pane
setblock ~3 ~2 ~1 minecraft:glass_pane
setblock ~-1 ~1 ~3 minecraft:glass_pane
setblock ~1 ~1 ~3 minecraft:glass_pane
fill ~-3 ~5 ~-3 ~3 ~5 ~3 minecraft:quartz_slab[type=bottom]
setblock ~ ~5 ~ minecraft:red_concrete
setblock ~-1 ~5 ~ minecraft:red_concrete
setblock ~1 ~5 ~ minecraft:red_concrete
setblock ~ ~5 ~-1 minecraft:red_concrete
setblock ~ ~5 ~1 minecraft:red_concrete
setblock ~-2 ~ ~-2 minecraft:white_bed[facing=south,part=foot]
setblock ~-2 ~ ~-1 minecraft:white_bed[facing=south,part=head]
setblock ~-2 ~ ~ minecraft:white_bed[facing=south,part=foot]
setblock ~-2 ~ ~1 minecraft:white_bed[facing=south,part=head]
setblock ~2 ~ ~-2 minecraft:white_bed[facing=south,part=foot]
setblock ~2 ~ ~-1 minecraft:white_bed[facing=south,part=head]
setblock ~2 ~ ~ minecraft:white_bed[facing=south,part=foot]
setblock ~2 ~ ~1 minecraft:white_bed[facing=south,part=head]
setblock ~ ~ ~2 minecraft:brewing_stand
setblock ~1 ~ ~2 minecraft:cauldron
setblock ~ ~4 ~ minecraft:lantern[hanging=true]
summon minecraft:marker ~ ~ ~ {Tags:["fp","fp_building","fp_medical","fp_shelter"]}
