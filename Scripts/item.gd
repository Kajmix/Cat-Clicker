extends Button

signal buy_pressed(item_id)

var item_id : String

func _ready():
	connect("pressed", Callable(self, "_on_pressed"))

func _on_pressed():
	emit_signal("buy_pressed", item_id)
