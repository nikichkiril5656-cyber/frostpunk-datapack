# Общая проверка перед принятием любого закона: Совет должен быть свободен.
# Возвращает 1 и запускает 12-часовую паузу, либо fail.
execute if score #law_cd fp matches 1.. run tellraw @s [{"text":"Совет ещё обсуждает прошлый закон. Осталось часов: ","color":"red"},{"score":{"name":"#law_cd","objective":"fp"},"color":"white"}]
execute if score #law_cd fp matches 1.. run return fail
scoreboard players set #law_cd fp 12
return 1
