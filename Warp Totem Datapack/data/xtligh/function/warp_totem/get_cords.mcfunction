#sets warp location to player's spawn
data modify storage xtligh:warp x set from entity @s respawn.pos[0]
data modify storage xtligh:warp y set from entity @s respawn.pos[1]
data modify storage xtligh:warp z set from entity @s respawn.pos[2]
data modify storage xtligh:warp d set value "minecraft:overworld"
data modify storage xtligh:warp d set from entity @s respawn.dimension

#sets warp location to lodestone (if possible)
#offhand
execute unless data entity @s SelectedItem.components.minecraft:custom_data.xtligh:warp_totem if data entity @s equipment.offhand.components.minecraft:lodestone_tracker run data modify storage xtligh:warp x set from entity @s equipment.offhand.components.minecraft:lodestone_tracker.target.pos[0]
execute unless data entity @s SelectedItem.components.minecraft:custom_data.xtligh:warp_totem if data entity @s equipment.offhand.components.minecraft:lodestone_tracker run data modify storage xtligh:warp y set from entity @s equipment.offhand.components.minecraft:lodestone_tracker.target.pos[1]
execute unless data entity @s SelectedItem.components.minecraft:custom_data.xtligh:warp_totem if data entity @s equipment.offhand.components.minecraft:lodestone_tracker run data modify storage xtligh:warp z set from entity @s equipment.offhand.components.minecraft:lodestone_tracker.target.pos[2]
execute unless data entity @s SelectedItem.components.minecraft:custom_data.xtligh:warp_totem if data entity @s equipment.offhand.components.minecraft:lodestone_tracker run data modify storage xtligh:warp d set from entity @s equipment.offhand.components.minecraft:lodestone_tracker.target.dimension
#mainhand
execute if data entity @s SelectedItem.components.minecraft:lodestone_tracker run data modify storage xtligh:warp x set from entity @s SelectedItem.components.minecraft:lodestone_tracker.target.pos[0]
execute if data entity @s SelectedItem.components.minecraft:lodestone_tracker run data modify storage xtligh:warp y set from entity @s SelectedItem.components.minecraft:lodestone_tracker.target.pos[1]
execute if data entity @s SelectedItem.components.minecraft:lodestone_tracker run data modify storage xtligh:warp z set from entity @s SelectedItem.components.minecraft:lodestone_tracker.target.pos[2]
execute if data entity @s SelectedItem.components.minecraft:lodestone_tracker run data modify storage xtligh:warp d set from entity @s SelectedItem.components.minecraft:lodestone_tracker.target.dimension

execute unless data storage xtligh:warp x run tellraw @s {"text":"You have no home bed or charged respawn anchor, or it was obstructed"}
execute if data storage xtligh:warp x at @s run playsound minecraft:entity.player.teleport player @a ~ ~ ~

#teleports the player
function xtligh:warp_totem/warp with storage xtligh:warp

#reset charge
scoreboard players set @s xtligh.warp_totem.timer 0