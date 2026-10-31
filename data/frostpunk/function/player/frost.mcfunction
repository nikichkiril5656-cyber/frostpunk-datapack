# Обморожение (раз в секунду, от имени игрока). Шкала fp_frost 0..100, ступени 25 / 50 / 75.
scoreboard players add @s fp_frost 0
scoreboard players add @s fp_fst 0

# Набор: чем холоднее, тем быстрее
execute if score @s fp_local matches -30..-11 if score #mod2 fp matches 0 run scoreboard players add @s fp_frost 1
execute if score @s fp_local matches -60..-31 run scoreboard players add @s fp_frost 1
execute if score @s fp_local matches ..-61 run scoreboard players add @s fp_frost 3
# Отогрев: в тепле шкала падает, в сильном тепле быстрее
execute if score @s fp_local matches -4.. run scoreboard players remove @s fp_frost 2
execute if score @s fp_local matches 15.. run scoreboard players remove @s fp_frost 2
scoreboard players operation @s fp_frost > #c0 fp
scoreboard players operation @s fp_frost < #c100 fp

# Ступень
scoreboard players set #st fp 0
execute if score @s fp_frost matches 25.. run scoreboard players set #st fp 1
execute if score @s fp_frost matches 50.. run scoreboard players set #st fp 2
execute if score @s fp_frost matches 75.. run scoreboard players set #st fp 3
execute if score #st fp > @s fp_fst if score #st fp matches 1 run tellraw @s {"text":"❄ Пальцы немеют: начинается обморожение. Согрейтесь у генератора или в укрытии.","color":"aqua"}
execute if score #st fp > @s fp_fst if score #st fp matches 2 run tellraw @s {"text":"❄ Обморожение: кожа белеет, руки не слушаются. Срочно в тепло!","color":"blue"}
execute if score #st fp > @s fp_fst if score #st fp matches 3 run tellraw @s {"text":"❄ Тяжёлое обморожение! Вы теряете силы и здоровье.","color":"dark_red"}
execute if score #st fp < @s fp_fst if score #st fp matches 0 run tellraw @s {"text":"Вы отогрелись.","color":"green"}
scoreboard players operation @s fp_fst = #st fp

# Последствия
execute if score #st fp matches 1.. run particle minecraft:snowflake ~ ~1 ~ 0.3 0.5 0.3 0.01 4
execute if score #st fp matches 1.. run effect give @s minecraft:slowness 3 0 true
execute if score #st fp matches 2.. run effect give @s minecraft:mining_fatigue 3 0 true
execute if score #st fp matches 2 if score #mod4 fp matches 0 run damage @s 1 minecraft:freeze
execute if score #st fp matches 3 run effect give @s minecraft:slowness 3 1 true
execute if score #st fp matches 3 run effect give @s minecraft:weakness 3 0 true
execute if score #st fp matches 3 if score #mod2 fp matches 0 run damage @s 2 minecraft:freeze
execute if score @s fp_frost matches 100 run damage @s 2 minecraft:freeze
