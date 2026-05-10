extends Node2D

@export var is_mirrored = false

func _ready() -> void:
	WorldManager.swap.connect(_on_swap)
	_on_swap(WorldManager.is_mirrored)

func _on_swap(is_mirrored):
	if is_mirrored:
		$"original world".visible = false
		$"original world".process_mode = Node.PROCESS_MODE_DISABLED
		
		$"mirrored world".visible = true
		$"mirrored world".process_mode = Node.PROCESS_MODE_INHERIT
	else:
		$"original world".visible = true
		$"original world".process_mode = Node.PROCESS_MODE_INHERIT
		
		$"mirrored world".visible = false
		$"mirrored world".process_mode = Node.PROCESS_MODE_DISABLED
