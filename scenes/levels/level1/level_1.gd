extends Node2D

@export var is_mirrored = false

func _ready() -> void:
	WorldManager.swap.connect(_on_swap)

func _on_swap(is_mirrored):
	print("swapped, mirrored is ", is_mirrored)
