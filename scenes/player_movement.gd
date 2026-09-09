extends CharacterBody2D

const SPEED = 300.0

signal reached_end

var move_enabled := false
var min_x := -INF
var max_x := INF

func _physics_process(_delta: float) -> void:
	if not move_enabled:
		return

	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED
	move_and_slide()

	global_position.x = clamp(global_position.x, min_x, max_x)

	if direction > 0.0 and global_position.x >= max_x:
		move_enabled = false
		reached_end.emit()
