extends Button

onready var scene_tree: = get_tree()


func _on_button_up() -> void:
	PlayerData.score = 0
	PlayerData.coins = 0
	scene_tree.paused = false
	scene_tree.reload_current_scene()
