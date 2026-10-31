# Общая проверка перед принятием закона. Возвращает 1 — закон можно применять, fail — нет.
# Вход: #pending_law (id триггера 30..39).
# Если в сети есть главы районов, законопроект выносится на голосование (vote/start), а сам закон
# применяется позже: vote/passed → vote/apply → снова сюда, уже с #vote_pass=1.
execute if score #vote_pass fp matches 1 run return run function frostpunk:law/begin_passed
execute if score #vote_t fp matches 1.. run tellraw @s {"text":"Совет уже голосует по другому законопроекту.","color":"red"}
execute if score #vote_t fp matches 1.. run return fail
execute if score #law_cd fp matches 1.. run tellraw @s [{"text":"Совет ещё обсуждает прошлый закон. Осталось часов: ","color":"red"},{"score":{"name":"#law_cd","objective":"fp"},"color":"white"}]
execute if score #law_cd fp matches 1.. run return fail
execute store result score #heads fp if entity @a[tag=fp_head]
execute if score #heads fp matches 1.. run return run function frostpunk:vote/start
scoreboard players set #law_cd fp 12
return 1
