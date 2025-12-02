extends Node2D

@onready var Click_Label = $CanvasLayer/Main/Main_Game/MarginContainer/PanelContainer/VBoxContainer/Click_Label
@onready var Auto_Click_Value = $CanvasLayer/Main/Main_Game/MarginContainer/PanelContainer/VBoxContainer/Auto_Click_Value

func _ready():
	GameVariables.load_game()
	update_label_data()
func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		GameVariables.save_game()
		get_tree().quit()
func update_label_data():
	Click_Label.text = "Clicks: %.0f" % float(GameVariables.clicks)
	Auto_Click_Value.text = "Auto Clicker Value: %.1f" % GameVariables.auto_click_value

func _clicked_button():
	GameVariables.add_clicks(GameVariables.click_value)
	update_label_data()

func game_tick_timeout():
	GameVariables.add_clicks(GameVariables.auto_click_value)
	update_label_data()
