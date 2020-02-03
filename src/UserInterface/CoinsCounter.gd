extends ColorRect

onready var scene_tree: = get_tree()
onready var coins_counter: = $HBoxContainer/Label as Label


func _ready() -> void:
	PlayerData.connect("coin_added", self, "update_interface")
	update_interface()


func update_interface() -> void:
	coins_counter.text = ("%s" % PlayerData.coins).pad_zeros(3)
