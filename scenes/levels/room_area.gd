extends Area2D

@onready var room_shape = $CollisionShape2D

signal room_change(bounds)

func get_room_bounds() -> Dictionary:
	var size = room_shape.get_shape().size
	var position = room_shape.global_position
	
	var top = position.y - (size.y/2)
	var bottom = position.y + (size.y/2)
	var left = position.x - (size.x/2)
	var right = position.x + (size.x/2)
	
	return {"top": top, "bottom": bottom, "left": left,"right": right}

func _ready() -> void:
	pass
