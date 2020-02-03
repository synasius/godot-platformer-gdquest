extends Area2D

export var next_scene: PackedScene

onready var anim_player: = ($AnimationPlayer as AnimationPlayer)


func _on_body_entered(_body: PhysicsBody2D) -> void:
	teleport()


func teleport() -> void:
	anim_player.play("fade_in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)
