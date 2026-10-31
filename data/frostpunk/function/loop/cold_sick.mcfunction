# Приток больных от холода: растёт с понижением температуры города и с численностью населения
scoreboard players operation #t fp = #city_temp fp
scoreboard players operation #t fp *= #cm1 fp
scoreboard players remove #t fp 15
scoreboard players operation #t fp /= #c10 fp
scoreboard players add #t fp 1
scoreboard players operation #t fp *= #pop fp
scoreboard players operation #t fp /= #c40 fp
scoreboard players operation #sick_in fp += #t fp
