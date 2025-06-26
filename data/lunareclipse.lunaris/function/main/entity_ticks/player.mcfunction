# If a player hasn't been given a guide book grant it to them.
execute if entity @s[tag=!lunaris.init2] run function lunareclipse.lunaris:guide_book
# If the player is holding a calendar in their main hand then replace it with a new one. This helps us to update the book by day.
execute if items entity @s weapon.mainhand minecraft:written_book[minecraft:custom_data={lunaris_calendar:1b}] run loot replace entity @s weapon.mainhand loot lunareclipse.lunaris:guide_book
execute if items entity @s weapon.offhand minecraft:written_book[minecraft:custom_data={lunaris_calendar:1b}] run loot replace entity @s weapon.offhand loot lunareclipse.lunaris:guide_book