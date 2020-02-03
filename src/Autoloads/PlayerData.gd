extends Node

signal coin_added
signal score_updated
signal player_died


var coins: = 0 setget set_coins
var score: = 0 setget set_score
var deaths: = 0 setget set_deaths


func reset() -> void:
	coins = 0
	score = 0
	deaths = 0


func set_coins(value: int) -> void:
	coins = value
	emit_signal("coin_added")


func set_score(value: int) -> void:
	score = value
	emit_signal("score_updated")


func set_deaths(value: int) -> void:
	deaths = value
	emit_signal("player_died")
