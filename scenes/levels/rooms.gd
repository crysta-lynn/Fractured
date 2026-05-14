extends Node2D

@onready var game = $"../.."
@onready var room_area = $roomArea
var room_bounds

signal change_room(bounds)

func _on_body_entered(body : Node2D):
	if body is player:
		room_bounds = room_area.get_room_bounds()
		change_room.emit(room_bounds)

func _on_swap_req():
	room_bounds = room_area.get_room_bounds()
	change_room.emit(room_bounds)
	
	if WorldManager.is_mirrored:
		$"original world".visible = false
		$"original world".process_mode = Node.PROCESS_MODE_DISABLED
		
		$"mirrored world".visible = true
		$"mirrored world".process_mode = Node.PROCESS_MODE_INHERIT
	else:
		$"original world".visible = true
		$"original world".process_mode = Node.PROCESS_MODE_INHERIT
		
		$"mirrored world".visible = false
		$"mirrored world".process_mode = Node.PROCESS_MODE_DISABLED


func _ready() -> void:
	add_to_group("rooms")
	
	room_area.body_entered.connect(_on_body_entered)
	game.swap_req.connect(_on_swap_req)
	_on_swap_req()
