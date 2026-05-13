extends Node2D

@onready var game = $"../.."
@onready var room_shape = $roomArea/CollisionShape2D

signal room_change(bounds)

func get_room_bounds() -> Dictionary:
	var size = room_shape.get_shape().size
	var position = room_shape.global_position
	
	var top = position.y - (size.y/2)
	var bottom = position.y + (size.y/2)
	var left = position.x - (size.x/2)
	var right = position.x + (size.x/2)
	
	return {"top": top, "bottom": bottom, "left": left,"right": right}

func _on_room_area_body_entered(body: Node2D) -> void:
	room_change.emit(get_room_bounds())
	
func _on_swap_req():
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
	game.swap_req.connect(_on_swap_req)
	_on_swap_req()
