extends Node

var is_mirrored := false

signal swap(is_mirrored)

func swap_world():
	is_mirrored = !is_mirrored
	swap.emit(is_mirrored)
