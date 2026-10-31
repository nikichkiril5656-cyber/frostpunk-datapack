# Эффекты холода (раз в секунду, только выживание/приключение)
execute if score @s fp_local matches ..-11 run effect give @s minecraft:slowness 3 0 true
execute if score @s fp_local matches ..-31 run effect give @s minecraft:mining_fatigue 3 0 true
execute if score @s fp_local matches ..-31 if score #mod4 fp matches 0 run damage @s 1 minecraft:freeze
execute if score @s fp_local matches ..-61 run effect give @s minecraft:slowness 3 1 true
execute if score @s fp_local matches ..-61 run effect give @s minecraft:weakness 3 0 true
execute if score @s fp_local matches ..-61 if score #mod2 fp matches 0 run damage @s 2 minecraft:freeze
