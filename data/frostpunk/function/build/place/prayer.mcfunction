fill ~-3 ~ ~-3 ~3 ~9 ~3 minecraft:air
fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 minecraft:smooth_quartz
fill ~-3 ~ ~-3 ~3 ~4 ~3 minecraft:quartz_bricks hollow
fill ~-1 ~1 ~-3 ~1 ~3 ~-3 minecraft:air
setblock ~-3 ~2 ~ minecraft:amethyst_block
setblock ~3 ~2 ~ minecraft:amethyst_block
setblock ~ ~2 ~3 minecraft:amethyst_block
setblock ~ ~1 ~2 minecraft:lectern[facing=north]
setblock ~-2 ~1 ~ minecraft:candle[candles=3,lit=true]
setblock ~2 ~1 ~ minecraft:candle[candles=3,lit=true]
fill ~-3 ~5 ~-3 ~3 ~5 ~3 minecraft:quartz_slab
fill ~-1 ~6 ~-1 ~1 ~7 ~1 minecraft:quartz_pillar
setblock ~ ~8 ~ minecraft:lightning_rod[facing=up]
summon minecraft:marker ~ ~ ~ {Tags:["fp","fp_building","fp_prayer","fp_shelter"]}
