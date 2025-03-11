#teleports the player
$execute in $(d) as @s run tp @s $(x) $(y) $(z)
execute as @s at @s run tp @s ~ ~1.1 ~

#removes stored values
data remove storage xtligh:warp x
data remove storage xtligh:warp y
data remove storage xtligh:warp z
data remove storage xtligh:warp d