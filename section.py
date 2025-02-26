import json

# Load the JSON file
with open("data.json", "r") as file:
    data = json.load(file)

# Find numbers where "Section" contains "vol ag"
matching_numbers = [num for num, details in data.items() if "vol ag" in details.get("Section", "").lower()]

# Print the result
print("Numbers with 'vol ag' in Section:", matching_numbers)
