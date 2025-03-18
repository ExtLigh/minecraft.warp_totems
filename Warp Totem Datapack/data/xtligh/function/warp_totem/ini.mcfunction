#sets warp location to lodestone (if possible)
#offhand
execute unless data entity extremelighning SelectedItem.components.minecraft:custom_data.xtligh:warp_totem if data entity extremelighning equipment.offhand.components.minecraft:custom_data.xtligh:warp_totem run scoreboard players add @s xtligh.warp_totem.timer 1

#mainhand
execute if data entity extremelighning SelectedItem.components.minecraft:custom_data.xtligh:warp_totem run scoreboard players add @s xtligh.warp_totem.timer 1

#checks if player has stopped using the totem
scoreboard players operation @s xtligh.warp_totem.time_since_charged = server_timer xtligh.server_time
scoreboard players add @s xtligh.warp_totem.time_since_charged 1
schedule function xtligh:warp_totem/check_charge 2t append

#start teleport
execute if score @s xtligh.warp_totem.timer = charged xtligh.warp_totem.timer at @s run function xtligh:warp_totem/get_cords

#removes advancement to make warp repeatable
advancement revoke @s only xtligh:warp_totem
