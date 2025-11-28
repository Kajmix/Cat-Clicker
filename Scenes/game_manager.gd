extends Node2D
@onready var Click_Label = $CanvasLayer/Main/Main_Game/MarginContainer/PanelContainer/VBoxContainer/Click_Label;
@onready var Auto_Click_Value = $CanvasLayer/Main/Main_Game/MarginContainer/PanelContainer/VBoxContainer/Auto_Click_Value;
var clicks = 0
var click_value = 1;
var auto_click_value = 0.1;
func _ready() -> void:
	update_label_data()

func update_label_data():
	Click_Label.text = String("Clicks: %.0f" % float(clicks))
	Auto_Click_Value.text = String("Auto Clicker Value: %.1f" % auto_click_value)

func add_clicks(amount):
	clicks += amount
	update_label_data()

func _clicked_button() -> void:
	add_clicks(1*click_value)


func game_tick_timeout() -> void:
	add_clicks(1*auto_click_value)
