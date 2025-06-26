# Cleanup the previous month effects.
function lunareclipse.lunaris:month/cleanup
# Apply the attributes.
attribute @s minecraft:attack_speed modifier add lunaris:monthly 0.1 add_multiplied_base
attribute @s minecraft:movement_speed modifier add lunaris:monthly 0.1 add_multiplied_base
attribute @s minecraft:jump_strength modifier add lunaris:monthly 0.1 add_multiplied_base
attribute @s minecraft:block_break_speed modifier add lunaris:monthly 0.1 add_multiplied_base
attribute @s minecraft:safe_fall_distance modifier add lunaris:monthly 0.25 add_multiplied_base