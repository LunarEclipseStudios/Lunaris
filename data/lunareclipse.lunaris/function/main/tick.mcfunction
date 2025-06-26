# Each month has 8 days, based on the moon cycle.
# - Largaric | Good fortune.
# - Fenaric | Lack of skill.
# - Menteric | Prosperity.
# - Kinjira | Hardship.
# - Linkopta | Good skill.
# - Fayomog | Bad Fortune.

# Define a entity tick for players.
execute as @a at @s run function lunareclipse.lunaris:main/entity_ticks/player

# Update the current day
execute store result score current_day lunaris.day run time query day

# Calculate the day of the current month (1-based index)
scoreboard players operation day_in_month lunaris.day = current_day lunaris.day
scoreboard players operation day_in_month lunaris.day %= divisor_day lunaris.constants
scoreboard players add day_in_month lunaris.day 1

# Calculate the current month (0-based index) and wrap it (0–5)
scoreboard players operation current_month lunaris.day = current_day lunaris.day
scoreboard players operation current_month lunaris.day /= divisor_day lunaris.constants

# Calculate the cycle (1-based index)
scoreboard players operation current_cycle lunaris.day = current_month lunaris.day
scoreboard players operation current_cycle lunaris.day /= divisor_month lunaris.constants
scoreboard players add current_cycle lunaris.day 1

# Wrap the month after checking the cycle this will prevent the cycle from breaking.
scoreboard players operation current_month lunaris.day %= divisor_month lunaris.constants

# Storage the current month in a storage variable. This is used to display it.
execute if score current_month lunaris.day matches 0 unless data storage lunareclipse.lunaris {current_month:"Largaric "} run data modify storage lunareclipse.lunaris current_month set value "Largaric "
execute if score current_month lunaris.day matches 1 unless data storage lunareclipse.lunaris {current_month:"Fenaric "} run data modify storage lunareclipse.lunaris current_month set value "Fenaric "
execute if score current_month lunaris.day matches 2 unless data storage lunareclipse.lunaris {current_month:"Menteric "} run data modify storage lunareclipse.lunaris current_month set value "Menteric "
execute if score current_month lunaris.day matches 3 unless data storage lunareclipse.lunaris {current_month:"Kinjira "} run data modify storage lunareclipse.lunaris current_month set value "Kinjira "
execute if score current_month lunaris.day matches 4 unless data storage lunareclipse.lunaris {current_month:"Linkopta "} run data modify storage lunareclipse.lunaris current_month set value "Linkopta "
execute if score current_month lunaris.day matches 5 unless data storage lunareclipse.lunaris {current_month:"Fayomog "} run data modify storage lunareclipse.lunaris current_month set value "Fayomog "

# Display the custom date in the action bar
# execute if score current_month lunaris.day matches 0 run title @a actionbar [{"text":"Largaric "},{"score":{"name":"day_in_month","objective":"lunaris.day"}},{"text":", "},{"text":"cycle "},{"score":{"name":"current_cycle","objective":"lunaris.day"}},{"text":"."}]
# execute if score current_month lunaris.day matches 1 run title @a actionbar [{"text":"Fenaric "},{"score":{"name":"day_in_month","objective":"lunaris.day"}},{"text":", "},{"text":"cycle "},{"score":{"name":"current_cycle","objective":"lunaris.day"}},{"text":"."}]
# execute if score current_month lunaris.day matches 2 run title @a actionbar [{"text":"Menteric "},{"score":{"name":"day_in_month","objective":"lunaris.day"}},{"text":", "},{"text":"cycle "},{"score":{"name":"current_cycle","objective":"lunaris.day"}},{"text":"."}]
# execute if score current_month lunaris.day matches 3 run title @a actionbar [{"text":"Kinjira "},{"score":{"name":"day_in_month","objective":"lunaris.day"}},{"text":", "},{"text":"cycle "},{"score":{"name":"current_cycle","objective":"lunaris.day"}},{"text":"."}]
# execute if score current_month lunaris.day matches 4 run title @a actionbar [{"text":"Linkopta "},{"score":{"name":"day_in_month","objective":"lunaris.day"}},{"text":", "},{"text":"cycle "},{"score":{"name":"current_cycle","objective":"lunaris.day"}},{"text":"."}]
# execute if score current_month lunaris.day matches 5 run title @a actionbar [{"text":"Fayomog "},{"score":{"name":"day_in_month","objective":"lunaris.day"}},{"text":", "},{"text":"cycle "},{"score":{"name":"current_cycle","objective":"lunaris.day"}},{"text":"."}]

# Adjust world settings based on the month.
execute if score current_month lunaris.day matches 0 as @a run function lunareclipse.lunaris:month/largaric
execute if score current_month lunaris.day matches 1 as @a run function lunareclipse.lunaris:month/fenaric
execute if score current_month lunaris.day matches 2 as @a run function lunareclipse.lunaris:month/menteric
execute if score current_month lunaris.day matches 3 as @a run function lunareclipse.lunaris:month/kinjira
execute if score current_month lunaris.day matches 4 as @a run function lunareclipse.lunaris:month/linkopta
execute if score current_month lunaris.day matches 5 as @a run function lunareclipse.lunaris:month/fayomog