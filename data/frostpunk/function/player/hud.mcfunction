execute if score @s fp_local matches 56.. run function frostpunk:player/hud_show {col:"dark_red",label:" ЖАРА!"}
execute if score @s fp_local matches 41..55 run function frostpunk:player/hud_show {col:"red",label:" ОЧЕНЬ ЖАРКО"}
execute if score @s fp_local matches 31..40 run function frostpunk:player/hud_show {col:"gold",label:" ЖАРКО"}
execute if score @s fp_local matches 1..30 run function frostpunk:player/hud_show {col:"green",label:""}
execute if score @s fp_local matches -10..0 run function frostpunk:player/hud_show {col:"aqua",label:""}
execute if score @s fp_local matches -30..-11 run function frostpunk:player/hud_show {col:"blue",label:" ХОЛОДНО"}
execute if score @s fp_local matches -60..-31 run function frostpunk:player/hud_show {col:"dark_aqua",label:" ЗАМЁРЗАЕТЕ!"}
execute if score @s fp_local matches ..-61 run function frostpunk:player/hud_show {col:"dark_red",label:" СМЕРТЕЛЬНЫЙ ХОЛОД!"}
