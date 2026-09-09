extends Node2D

const GAP := 30.0

@onready var player: CharacterBody2D = $CharacterBody2D
@onready var player_sprite: Sprite2D = player.get_node("Sprite2D")
@onready var crystal: Sprite2D = $Sprite2D
@onready var start_button: Button = $UI/StartButton
@onready var reached_label: Label = $UI/ReachedLabel

func _ready() -> void:
	reached_label.hide()

	player.min_x = player.global_position.x

	var player_half_width: float = player_sprite.texture.get_width() * 0.5 * player_sprite.scale.x
	var player_right_edge_offset: float = player_sprite.position.x + player_half_width

	var crystal_half_width: float = crystal.texture.get_width() * 0.5 * crystal.scale.x
	var crystal_left_edge: float = crystal.position.x - crystal_half_width

	player.max_x = crystal_left_edge - GAP - player_right_edge_offset

	player.reached_end.connect(_on_player_reached_end)
	start_button.pressed.connect(_on_start_pressed)

func _on_start_pressed() -> void:
	start_button.hide()
	player.move_enabled = true

func _on_player_reached_end() -> void:
	reached_label.show()
