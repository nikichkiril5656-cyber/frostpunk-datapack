fill ~-3 ~ ~-3 ~3 ~7 ~3 minecraft:air
fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 minecraft:quartz_block
fill ~-3 ~ ~-3 ~3 ~3 ~3 minecraft:white_concrete hollow
fill ~ ~1 ~-3 ~ ~2 ~-3 minecraft:air
setblock ~-3 ~2 ~ minecraft:glass_pane
setblock ~3 ~2 ~ minecraft:glass_pane
fill ~-3 ~4 ~-3 ~3 ~4 ~3 minecraft:white_concrete
fill ~-1 ~4 ~ ~1 ~4 ~ minecraft:red_concrete
setblock ~ ~4 ~-1 minecraft:red_concrete
setblock ~ ~4 ~1 minecraft:red_concrete
setblock ~-2 ~1 ~2 minecraft:brewing_stand
setblock ~2 ~1 ~1 minecraft:white_bed[facing=south,part=foot]
setblock ~2 ~1 ~2 minecraft:white_bed[facing=south,part=head]
setblock ~ ~1 ~1 minecraft:lantern
summon minecraft:marker ~ ~ ~ {Tags:["fp","fp_building","fp_medical","fp_shelter"]}
