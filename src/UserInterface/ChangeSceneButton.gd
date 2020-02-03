tool
extends Button

onready var scene_tree: = get_tree()

export(String, FILE) var next_scene_path: = ""


func _on_button_up() -> void:
	PlayerData.reset()
	scene_tree.paused = false
	scene_tree.change_scene(next_scene_path)


func _get_configuration_warning() -> String:
	if next_scene_path == "":
		return "next_scene_path should not be empty for the button to work"
	return ""
