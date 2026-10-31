# Автогенерация: tools/gen_buildings.py. Не править вручную.
fill ~-3 ~ ~3 ~3 ~6 ~-3 minecraft:air
fill ~-3 ~-5 ~3 ~3 ~-2 ~-3 minecraft:cobblestone keep
fill ~-3 ~-1 ~3 ~3 ~-1 ~-3 minecraft:coarse_dirt
fill ~-2 ~-1 ~2 ~2 ~-1 ~-2 minecraft:spruce_planks
fill ~-2 ~ ~2 ~2 ~ ~2 minecraft:white_wool
fill ~-2 ~ ~-2 ~2 ~ ~-2 minecraft:white_wool
fill ~-2 ~1 ~1 ~2 ~1 ~1 minecraft:light_gray_wool
fill ~-2 ~1 ~-1 ~2 ~1 ~-1 minecraft:light_gray_wool
fill ~-2 ~2 ~ ~2 ~2 ~ minecraft:red_wool
fill ~2 ~ ~1 ~2 ~ ~-1 minecraft:white_wool
setblock ~2 ~1 ~ minecraft:light_gray_wool
setblock ~-2 ~ ~1 minecraft:white_wool
setblock ~-2 ~ ~-1 minecraft:white_wool
setblock ~-1 ~ ~1 minecraft:red_bed[facing=east,part=foot]
setblock ~ ~ ~1 minecraft:red_bed[facing=east,part=head]
setblock ~1 ~ ~-1 minecraft:barrel[facing=up]
setblock ~ ~1 ~ minecraft:lantern[hanging=true]
setblock ~-3 ~ ~-2 minecraft:campfire[lit=true]
setblock ~-3 ~ ~2 minecraft:spruce_fence
setblock ~-3 ~1 ~2 minecraft:lantern
summon minecraft:marker ~ ~ ~ {Tags:["fp","fp_building","fp_tent","fp_shelter"]}
