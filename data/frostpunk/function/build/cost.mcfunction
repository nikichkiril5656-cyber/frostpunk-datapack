# Макрос: проверка и списание стоимости. Возвращает 1 при успехе и fail при нехватке ресурсов.
$execute unless score #wood fp matches $(wood).. run tellraw @s [{"text":"Не хватает ресурсов! Нужно: ","color":"red"},{"text":"дерево $(wood), сталь $(steel)","color":"yellow"}]
$execute unless score #wood fp matches $(wood).. run return fail
$execute unless score #steel fp matches $(steel).. run tellraw @s [{"text":"Не хватает ресурсов! Нужно: ","color":"red"},{"text":"дерево $(wood), сталь $(steel)","color":"yellow"}]
$execute unless score #steel fp matches $(steel).. run return fail
$scoreboard players remove #wood fp $(wood)
$scoreboard players remove #steel fp $(steel)
return 1
