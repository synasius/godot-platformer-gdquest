extends Actor

onready var stomp_detector: = $StompDetector as Area2D

export var score: = 100


func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -speed.x


func _on_StompDetector_body_entered(body: PhysicsBody2D) -> void:
	check_position_and_die(body)


func check_position_and_die(node: Node2D) -> void:
	if node.global_position.y > stomp_detector.global_position.y:
		return
	die()


func _physics_process(delta: float) -> void:
	if is_on_wall():
		_velocity.x *= -1.0
	_velocity.y += gravity * delta
	_velocity.y = move_and_slide_with_snap(_velocity, Vector2.DOWN * 50.0, FLOOR_NORMAL, true, 4, PI / 3.0).y


func die() -> void:
	PlayerData.score += score
	queue_free()
