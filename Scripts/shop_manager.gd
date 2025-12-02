extends ScrollContainer
@onready var V_Shop_Container : VBoxContainer = $V_Shop_Container
var button_scene = load("res://Scenes/item.tscn")
var gameManager = load("res://Scripts/game_manager.gd")
var shop_items={
	"Helper_Cat" : {
		"name" : "Helper Cat ^^",
		"price" : 15,
		"power" : 0.1,
		"description" : "Ready to work! Meow!",
		"icon" : "res://Assets/icon.svg"
	},
	"cursor2" : {
		"name" : "Helper Cat ^^",
		"price" : 30,
		"power" : 0.5,
		"description" : "Ready to work! Meow!",
		"icon" : "res://Assets/icon.svg"
	},
	"cursor3" : {
		"name" : "Helper Cat ^^",
		"price" : 60,
		"power" : 1,
		"description" : "Ready to work! Meow!",
		"icon" : "res://Assets/icon.svg"
	},
	"cursor4" : {
		"name" : "Helper Cat ^^",
		"price" : 1,
		"power" : 100,
		"description" : "Ready to work! Meow!",
		"icon" : "res://Assets/icon.svg"
	}
}

func _ready() -> void:
	for id in shop_items:
		var new_item = button_scene.instantiate()
		new_item.icon = load(shop_items[id].icon)
		new_item.text = shop_items[id].name + "\nPrice: " + str(shop_items[id].price) + "\n" + shop_items[id].description
		new_item.item_id = id
		new_item.connect("buy_pressed", Callable(self, "buy_item"))
		V_Shop_Container.add_child(new_item)


func buy_item(id : String):
	var item = shop_items[id]
	if GameVariables.clicks >= item.price:
		GameVariables.subdivide_clicks(item.price)
		GameVariables.auto_click_value += item.power
