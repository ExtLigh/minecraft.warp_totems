#reduces ammo
data modify storage xtligh:warp_totem ammo_slot set from entity @s Inventory[{id:"minecraft:echo_shard"}].Slot
execute if entity @s[gamemode=!creative] if score requires_ammo xtligh.warp_totems.config matches 1 run function xtligh:warp_totem/lower_ammo with storage xtligh:warp_totem

#sets warp location to point of death (if possible)
#offhand
execute unless data entity @s SelectedItem.components.minecraft:custom_data.xtligh:warp_totem if data entity @s equipment.offhand.components.minecraft:custom_data.xtligh:recovery_totem run data modify storage xtligh:warp x set from entity @s LastDeathLocation.pos[0]
execute unless data entity @s SelectedItem.components.minecraft:custom_data.xtligh:warp_totem if data entity @s equipment.offhand.components.minecraft:custom_data.xtligh:recovery_totem run data modify storage xtligh:warp y set from entity @s LastDeathLocation.pos[1]
execute unless data entity @s SelectedItem.components.minecraft:custom_data.xtligh:warp_totem if data entity @s equipment.offhand.components.minecraft:custom_data.xtligh:recovery_totem run data modify storage xtligh:warp z set from entity @s LastDeathLocation.pos[2]
execute unless data entity @s SelectedItem.components.minecraft:custom_data.xtligh:warp_totem if data entity @s equipment.offhand.components.minecraft:custom_data.xtligh:recovery_totem run data modify storage xtligh:warp d set from entity @s LastDeathLocation.dimension
#mainhand
execute if data entity @s SelectedItem.components.minecraft:custom_data.xtligh:recovery_totem run data modify storage xtligh:warp x set from entity @s LastDeathLocation.pos[0]
execute if data entity @s SelectedItem.components.minecraft:custom_data.xtligh:recovery_totem run data modify storage xtligh:warp y set from entity @s LastDeathLocation.pos[1]
execute if data entity @s SelectedItem.components.minecraft:custom_data.xtligh:recovery_totem run data modify storage xtligh:warp z set from entity @s LastDeathLocation.pos[2]
execute if data entity @s SelectedItem.components.minecraft:custom_data.xtligh:recovery_totem run data modify storage xtligh:warp d set from entity @s LastDeathLocation.dimension

execute unless data entity @s SelectedItem.components.minecraft:custom_data.xtligh:warp_totem at @s run playsound minecraft:entity.warden.emerge player @a ~ ~ ~

#teleports the player
function xtligh:warp_totem/warp with storage xtligh:warp

#reset charge
scoreboard players set @s xtligh.recovery_totem.timer 0