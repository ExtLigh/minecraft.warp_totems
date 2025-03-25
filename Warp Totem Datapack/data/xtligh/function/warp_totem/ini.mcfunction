#adds 1 to use timer
#offhand
execute unless data entity @s SelectedItem.components.minecraft:custom_data.xtligh:warp_totem if data entity @s equipment.offhand.components.minecraft:custom_data.xtligh:warp_totem run scoreboard players add @s xtligh.warp_totem.timer 1
execute unless data entity @s SelectedItem.components.minecraft:custom_data.xtligh:recovery_totem if data entity @s equipment.offhand.components.minecraft:custom_data.xtligh:recovery_totem run scoreboard players add @s xtligh.recovery_totem.timer 1

#mainhand
execute if data entity @s SelectedItem.components.minecraft:custom_data.xtligh:warp_totem run scoreboard players add @s xtligh.warp_totem.timer 1
execute if data entity @s SelectedItem.components.minecraft:custom_data.xtligh:recovery_totem run scoreboard players add @s xtligh.recovery_totem.timer 1


#checks if player has stopped using the totem
scoreboard players operation @s xtligh.warp_totem.time_since_charged = server_timer xtligh.server_time
scoreboard players add @s xtligh.warp_totem.time_since_charged 1
schedule function xtligh:warp_totem/check_charge 2t append

#start teleport
execute if score requires_ammo xtligh.warp_totems.config matches 1 if score @s xtligh.warp_totem.timer matches 100 if predicate {"condition":"minecraft:any_of","terms":[{"condition":"minecraft:entity_properties","entity":"this","predicate":{"nbt":"{Inventory:[{id:\"minecraft:ender_pearl\"}]}"}},{"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","gamemode":["creative"]}}}]} at @s run function xtligh:warp_totem/get_cords
execute if score requires_ammo xtligh.warp_totems.config matches 1 if score @s xtligh.recovery_totem.timer matches 20 if predicate {"condition":"minecraft:any_of","terms":[{"condition":"minecraft:entity_properties","entity":"this","predicate":{"nbt":"{Inventory:[{id:\"minecraft:echo_shard\"}]}"}},{"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","gamemode":["creative"]}}}]} at @s run function xtligh:warp_totem/get_death_cords

execute if score requires_ammo xtligh.warp_totems.config matches 0 if score @s xtligh.warp_totem.timer matches 100 at @s run function xtligh:warp_totem/get_cords
execute if score requires_ammo xtligh.warp_totems.config matches 0 if score @s xtligh.recovery_totem.timer matches 20 at @s run function xtligh:warp_totem/get_death_cords

#removes advancement to make warp repeatable
advancement revoke @s only xtligh:warp_totem
advancement revoke @s only xtligh:recovery_totem
