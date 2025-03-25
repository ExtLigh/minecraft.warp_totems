#teleports the player
$execute in $(d) as @s run tp @s $(x) $(y) $(z)
execute as @s at @s run tp @s ~ ~1.1 ~
execute if score @s xtligh.warp_totem.timer matches 100 at @s run playsound minecraft:entity.player.teleport player @a ~ ~ ~
execute if score @s xtligh.recovery_totem.timer matches 20 at @s run playsound minecraft:entity.warden.emerge player @a ~ ~ ~

#removes stored values
data remove storage xtligh:warp x
data remove storage xtligh:warp y
data remove storage xtligh:warp z
data remove storage xtligh:warp d
data remove storage xtligh:warp ammo_slot