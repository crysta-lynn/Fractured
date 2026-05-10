extends Node2D

@export var is_mirrored = false

func _ready() -> void:
	WorldManager.swap.connect(_on_swap)

func _on_swap(is_mirrored):
	if is_mirrored:
		$"original world".visible = false
		$"mirrored world".visible = true
	else:
		$"original world".visible = true
		$"mirrored world".visible = false
