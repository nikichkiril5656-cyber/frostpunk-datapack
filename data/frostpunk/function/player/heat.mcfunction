# Перегрев и тепловая интоксикация (раз в секунду, от имени игрока). Шкала fp_heat 0..100, ступени 25 / 50 / 75.
scoreboard players add @s fp_heat 0
scoreboard players add @s fp_hst 0

# Набор: чем жарче, тем быстрее
execute if score @s fp_local matches 31..40 if score #mod2 fp matches 0 run scoreboard players add @s fp_heat 1
execute if score @s fp_local matches 41..55 run scoreboard players add @s fp_heat 1
execute if score @s fp_local matches 56.. run scoreboard players add @s fp_heat 3
# Остывание: в комфортной температуре шкала падает, в воде быстрее
execute if score @s fp_local matches ..25 run scoreboard players remove @s fp_heat 2
execute if block ~ ~ ~ minecraft:water run scoreboard players remove @s fp_heat 4
scoreboard players operation @s fp_heat > #c0 fp
scoreboard players operation @s fp_heat < #c100 fp

# Ступень
scoreboard players set #st fp 0
execute if score @s fp_heat matches 25.. run scoreboard players set #st fp 1
execute if score @s fp_heat matches 50.. run scoreboard players set #st fp 2
execute if score @s fp_heat matches 75.. run scoreboard players set #st fp 3
execute if score #st fp > @s fp_hst if score #st fp matches 1 run tellraw @s {"text":"☀ Жарко: во рту пересохло, хочется пить. Снимите тёплую одежду или найдите тень и воду.","color":"gold"}
execute if score #st fp > @s fp_hst if score #st fp matches 2 run tellraw @s {"text":"☀ Тепловая интоксикация: тошнота и слабость. Войдите в воду или в укрытие!","color":"red"}
execute if score #st fp > @s fp_hst if score #st fp matches 3 run tellraw @s {"text":"☀ ТЕПЛОВОЙ УДАР! Вы отравлены и теряете здоровье.","color":"dark_red"}
execute if score #st fp < @s fp_hst if score #st fp matches 0 run tellraw @s {"text":"Вы пришли в себя.","color":"green"}
scoreboard players operation @s fp_hst = #st fp

# Последствия
execute if score #st fp matches 1.. run particle minecraft:smoke ~ ~1.6 ~ 0.2 0.2 0.2 0.01 3
execute if score #st fp matches 1.. run effect give @s minecraft:hunger 3 0 true
execute if score #st fp matches 2.. run effect give @s minecraft:nausea 6 0 true
execute if score #st fp matches 2.. run effect give @s minecraft:weakness 3 0 true
execute if score #st fp matches 3 run effect give @s minecraft:poison 3 0 true
execute if score #st fp matches 3 run effect give @s minecraft:slowness 3 0 true
execute if score #st fp matches 3 if score #mod2 fp matches 0 run damage @s 1 minecraft:generic
execute if score @s fp_heat matches 100 run damage @s 2 minecraft:generic
