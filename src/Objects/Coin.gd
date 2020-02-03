extends Area2D

onready var anim_player: = ($AnimationPlayer as AnimationPlayer)

export var score: = 50


func _on_Coin_body_entered(_body: PhysicsBody2D) -> void:
	picked()


func picked() -> void:
	PlayerData.score += score
	PlayerData.coins += 1
	anim_player.play("fade_out")
