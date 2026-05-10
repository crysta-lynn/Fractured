extends Area2D

var is_player_in_area := false

func _ready() -> void:
	add_to_group("mirrors")

func _on_body_entered(body: Node2D) -> void:
	if body is player:
		print("entered mirror body")
		is_player_in_area = true

func _on_body_exited(body: Node2D) -> void:
	if body is player:
		is_player_in_area = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if is_player_in_area:
			WorldManager.swap_world()
