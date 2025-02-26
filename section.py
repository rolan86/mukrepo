import json

# Load the JSON file
with open("data.json", "r") as file:
    data = json.load(file)

# Find numbers where any list entry contains "vol ag"
matching_numbers = [
    num for num, sections in data.items() 
    if any("vol ag" in section.lower() for section in sections)
]

# Print the result
print("Numbers with 'vol ag' in Section:", matching_numbers)


.up::after { content: " ⬆️"; color: red; }
.down::after { content: " ⬇️"; color: green; }
.no-change::after { content: " ➖"; color: gray; }
