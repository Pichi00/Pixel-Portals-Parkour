extends Control

@export var next_scene:PackedScene

func _on_play_button_pressed():
	get_tree().change_scene_to_packed(next_scene)


func _on_itch_button_pressed():
	OS.shell_open("https://pichidev.itch.io/")


func _on_x_button_pressed():
	OS.shell_open("https://twitter.com/pichiDev")
