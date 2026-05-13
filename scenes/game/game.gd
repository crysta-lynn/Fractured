extends Node2D

@onready var fade = $CanvasLayer/screenFade
@onready var camera = $player/Camera2D
@onready var player = $player

signal swap_req

func _on_swap(is_mirrored):
	player.CAN_MOVE = false
	set_process_input(false)
	camera.position_smoothing_enabled = false
	
	await fade.fade_out()
	
	swap_req.emit()
	scale.x = -1 if is_mirrored else 1
	set_process_input(true)
	player.CAN_MOVE = true
	
	await fade.fade_in()
	
	camera.position_smoothing_enabled = true

func change_room():
	

func _ready() -> void:
	WorldManager.swap.connect(_on_swap)
