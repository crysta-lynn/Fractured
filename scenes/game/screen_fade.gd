extends Node

@onready var animation = $AnimationPlayer

func fade_out():
	animation.play("fade_out")
	await animation.animation_finished

func fade_in():
	animation.play("fade_in")
	await animation.animation_finished
