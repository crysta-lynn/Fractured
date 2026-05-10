extends Node2D

func _on_swap(is_mirrored):
	scale.x = -1 if is_mirrored else 1

func _ready() -> void:
	WorldManager.swap.connect(_on_swap)
