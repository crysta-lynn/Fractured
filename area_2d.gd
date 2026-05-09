extends Area2D

signal swap

func _on_body_entered(body: Node2D) -> void:
	if body is player:
		if Input.is_action_just_pressed("interact"):
			swap.emit()
