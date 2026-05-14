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
	
	scale.x = -1 if is_mirrored else 1
	swap_req.emit()
	
	set_process_input(true)
	player.CAN_MOVE = true
	
	await fade.fade_in()
	
	camera.position_smoothing_enabled = true
	

func _on_change_camera_limits(room_bounds):
	camera.limit_left = room_bounds.left
	camera.limit_right = room_bounds.right
	camera.limit_bottom = room_bounds.bottom
	camera.limit_top = room_bounds.top

func _ready() -> void:
	var rooms = get_tree().get_nodes_in_group("rooms")
	WorldManager.swap.connect(_on_swap)
	
	for room in rooms:
		room.change_room.connect(_on_change_camera_limits)
