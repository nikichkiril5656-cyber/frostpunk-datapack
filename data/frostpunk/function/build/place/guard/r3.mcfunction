# Автогенерация: tools/gen_buildings.py. Не править вручную.
fill ~-3 ~ ~3 ~3 ~11 ~-3 minecraft:air
fill ~-3 ~-5 ~3 ~3 ~-2 ~-3 minecraft:cobblestone keep
fill ~-3 ~-1 ~3 ~3 ~-1 ~-3 minecraft:stone_bricks
fill ~-2 ~ ~2 ~2 ~5 ~-2 minecraft:stone_bricks
fill ~-1 ~ ~1 ~1 ~5 ~-1 minecraft:air
fill ~-2 ~6 ~2 ~2 ~6 ~-2 minecraft:stone_bricks
fill ~-1 ~ ~-1 ~-1 ~6 ~-1 minecraft:ladder[facing=east]
setblock ~-2 ~7 ~2 minecraft:stone_brick_wall
setblock ~ ~7 ~2 minecraft:stone_brick_wall
setblock ~2 ~7 ~2 minecraft:stone_brick_wall
setblock ~-2 ~7 ~ minecraft:stone_brick_wall
setblock ~2 ~7 ~ minecraft:stone_brick_wall
setblock ~-2 ~7 ~-2 minecraft:stone_brick_wall
setblock ~ ~7 ~-2 minecraft:stone_brick_wall
setblock ~2 ~7 ~-2 minecraft:stone_brick_wall
setblock ~-2 ~ ~ minecraft:dark_oak_door[facing=west,half=lower]
setblock ~-2 ~1 ~ minecraft:dark_oak_door[facing=west,half=upper]
setblock ~ ~2 ~2 minecraft:iron_bars
setblock ~ ~2 ~-2 minecraft:iron_bars
setblock ~2 ~2 ~ minecraft:iron_bars
setblock ~ ~4 ~2 minecraft:iron_bars
setblock ~ ~4 ~-2 minecraft:iron_bars
setblock ~2 ~4 ~ minecraft:iron_bars
setblock ~-2 ~4 ~ minecraft:iron_bars
setblock ~-3 ~3 ~ minecraft:red_wall_banner[facing=west]
setblock ~-3 ~ ~2 minecraft:stone_brick_wall
setblock ~-3 ~1 ~2 minecraft:lantern
setblock ~-3 ~ ~-2 minecraft:stone_brick_wall
setblock ~-3 ~1 ~-2 minecraft:lantern
setblock ~1 ~ ~1 minecraft:grindstone[face=floor,facing=west]
setblock ~-1 ~ ~1 minecraft:barrel[facing=up]
setblock ~-1 ~1 ~1 minecraft:lantern
summon minecraft:marker ~ ~ ~ {Tags:["fp","fp_building","fp_guard","fp_shelter"]}
