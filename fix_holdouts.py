#!/usr/bin/env python3
# Add corruption multipliers to Holdouts faction

file_path = r"c:\Users\Pranav\Desktop\SinglePlayerCampaign\Data\XML\Factions.xml"

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Find the last occurrence of </Faction> and insert before it
corruption_block = """
		<Corruption_Galactic_Production_Time_Multipliers> 1.0, 1.0 </Corruption_Galactic_Production_Time_Multipliers>
		<Corruption_Galactic_Production_Price_Multipliers> 1.0, 1.0 </Corruption_Galactic_Production_Price_Multipliers>
		<Corruption_Tactical_Production_Time_Multipliers> 1.0, 1.0 </Corruption_Tactical_Production_Time_Multipliers>
		<Corruption_Tactical_Production_Price_Multipliers> 1.0, 1.0 </Corruption_Tactical_Production_Price_Multipliers>
		<Corruption_Tactical_Build_Pad_Time_Multipliers> 1.0, 1.0 </Corruption_Tactical_Build_Pad_Time_Multipliers>
		<Corruption_Tactical_Build_Pad_Price_Multipliers> 1.0, 1.0 </Corruption_Tactical_Build_Pad_Price_Multipliers>
	"""

# Find the position of the last </Faction>
last_faction_pos = content.rfind('</Faction>')
if last_faction_pos != -1:
    # Insert before the last </Faction>
    new_content = content[:last_faction_pos] + corruption_block + '\n\t</Faction>' + content[last_faction_pos + len('</Faction>'):]
    
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    print("Successfully added corruption multipliers to Holdouts faction!")
else:
    print("ERROR: Could not find </Faction> tag")
