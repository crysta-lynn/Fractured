extends Node2D

@onready var fade = $CanvasLayer/screenFade
@onready var camera = $player/Camera2D
@onready var player = $player

func _on_swap(is_mirrored):
	player.CAN_MOVE = false
	camera.position_smoothing_enabled = false
	
	await fade.fade_out()
	
	scale.x = -1 if is_mirrored else 1
	
	await fade.fade_in()
	
	camera.position_smoothing_enabled = true
	player.CAN_MOVE = true

func _ready() -> void:
	WorldManager.swap.connect(_on_swap)
