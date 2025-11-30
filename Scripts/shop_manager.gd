extends ScrollContainer
@onready var V_Shop_Container : VBoxContainer = $V_Shop_Container
var button_scene = load("res://Scenes/item.tscn");
var shop_items={
	"Helper_Cat" : {
		"name" : "Helper Cat ^^",
		"price" : 15,
		"description" : "Ready to work! Meow!",
		"icon" : "res://Assets/icon.svg"
	},
	"cursor2" : {
		"name" : "Helper Cat ^^",
		"price" : 15,
		"description" : "Ready to work! Meow!",
		"icon" : "res://Assets/icon.svg"
	},
	"cursor3" : {
		"name" : "Helper Cat ^^",
		"price" : 15,
		"description" : "Ready to work! Meow!",
		"icon" : "res://Assets/icon.svg"
	}
}

func _ready() -> void:
	for item in shop_items:
		var new_Item = button_scene.instantiate()
		new_Item.icon = load(shop_items[item].icon)
		new_Item.text = shop_items[item].name + "\n Price:" + str(shop_items[item].price) + "\n" + shop_items[item].description
		V_Shop_Container.add_child(new_Item)

func buy_item(id : String):
	var item = shop_items[id]
