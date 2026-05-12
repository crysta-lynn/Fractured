extends Node2D

@onready var game = $"../.."

func _ready() -> void:
	game.swap_req.connect(_on_swap_req)
	_on_swap_req()

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
