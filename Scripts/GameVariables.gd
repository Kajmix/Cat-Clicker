extends Node2D

var clicks = 0
var click_value = 1
var auto_click_value = 0.1

func add_clicks(amount):
	clicks += amount

func subdivide_clicks(amount):
	clicks -= amount

func save_game():
	var save_data = {
		"clicks": clicks,
		"click_value": click_value,
		"auto_click_value": auto_click_value
	}

	var json = JSON.stringify(save_data)

	var file = FileAccess.open("user://save.json", FileAccess.WRITE)
	file.store_string(json)
	file.close()

	print("Game saved!")

func load_game():
	if not FileAccess.file_exists("user://save.json"):
		print("No save file found.")
		return

	var file = FileAccess.open("user://save.json", FileAccess.READ)
	var json_text = file.get_as_text()
	file.close()

	var result = JSON.parse_string(json_text)
	if result == null:
		print("Save file corrupted.")
		return

	clicks = result.get("clicks", 0)
	click_value = result.get("click_value", 1)
	auto_click_value = result.get("auto_click_value", 0.1)

	print("Game loaded!")
