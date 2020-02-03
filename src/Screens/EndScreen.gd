extends Control

onready var results_label: = $Label as Label


func _ready() -> void:
	results_label.text = results_label.text % [PlayerData.score, PlayerData.deaths]
