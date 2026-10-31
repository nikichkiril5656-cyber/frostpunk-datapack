# Уровень генератора = значение триггера - 10 (триггеры 10..13 → уровни 0..3)
scoreboard players operation #gen_level fp = @s fp_menu
scoreboard players remove #gen_level fp 10
tellraw @a [{"text":"[Генератор] ","color":"gold"},{"selector":"@s","color":"yellow"},{"text":" установил уровень нагрева: ","color":"gray"},{"score":{"name":"#gen_level","objective":"fp"},"color":"white"}]
