# Выполняется от имени игрока, внёсшего законопроект. Всегда завершается fail: закон применится после голосования.
tag @a remove fp_proposer
tag @s add fp_proposer
scoreboard players operation #vote_law fp = #pending_law fp
scoreboard players set #vote_t fp 60
scoreboard players set @a fp_vote 0
execute if score #vote_law fp matches 30 run function frostpunk:vote/announce {name:"Опилочный суп"}
execute if score #vote_law fp matches 31 run function frostpunk:vote/announce {name:"Двойные пайки"}
execute if score #vote_law fp matches 32 run function frostpunk:vote/announce {name:"Удлинённые смены"}
execute if score #vote_law fp matches 33 run function frostpunk:vote/announce {name:"Аварийные смены"}
execute if score #vote_law fp matches 34 run function frostpunk:vote/announce {name:"Детский труд"}
execute if score #vote_law fp matches 35 run function frostpunk:vote/announce {name:"Безопасные цеха"}
execute if score #vote_law fp matches 36 run function frostpunk:vote/announce {name:"Ампутации"}
execute if score #vote_law fp matches 37 run function frostpunk:vote/announce {name:"Радикальное лечение"}
execute if score #vote_law fp matches 38 run function frostpunk:vote/announce {name:"Мартиальный закон"}
execute if score #vote_law fp matches 39 run function frostpunk:vote/announce {name:"Учение веры"}
return fail
