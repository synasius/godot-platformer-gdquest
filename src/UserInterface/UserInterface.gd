extends Control

onready var scene_tree: = get_tree()
onready var pause_overlay: = $PauseOverlay as ColorRect
onready var score_label: = $Score as Label
onready var pause_title: = $PauseOverlay/Title as Label

var _player_is_dead: = false
var paused: = false setget set_paused


func _ready() -> void:
	PlayerData.connect("score_updated", self, "update_interface")
	PlayerData.connect("player_died", self, "_on_player_died")
	update_interface()


func _on_player_died() -> void:
	pause_title.text = "You died!"
	_player_is_dead = true
	set_paused(true)


func _unhandled_input(event: InputEvent) -> void:
	if (event.is_action_pressed("pause")) and not _player_is_dead:
		set_paused(not paused)
		scene_tree.set_input_as_handled()


func update_interface() -> void:
	score_label.text = "Score %s" % PlayerData.score


func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
