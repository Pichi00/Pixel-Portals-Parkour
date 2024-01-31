extends Control

func _ready():
	$VicotoryMusic.volume_db = Global.music
	MusicController.stop_gameplay_music()



func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
