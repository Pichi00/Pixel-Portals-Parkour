extends Control

@export var next_scene:PackedScene

func _ready():
	$MenuMusic.volume_db = Global.music
	update_labels()

func _on_play_button_pressed():
	get_tree().change_scene_to_packed(next_scene)


func _on_itch_button_pressed():
	OS.shell_open("https://pichidev.itch.io/")


func _on_x_button_pressed():
	OS.shell_open("https://twitter.com/pichiDev")


func _on_menu_music_finished():
	$MenuMusic.play()

func update_labels():
	$SFXSettings/SFXVolumeLabel.text = str((Global.sfx + 80)/10 )
	$MusicSettings/MusicVolumeLabel.text = str((Global.music + 80)/10 )


func _on_musicp_pressed():
	if(Global.music <=-0):
		Global.music += 10
		update_labels()
		$MenuMusic.volume_db = Global.music


func _on_musicm_pressed():
	if(Global.music >-80):
		Global.music -= 10
		update_labels()
		$MenuMusic.volume_db = Global.music


func _on_sfxm_pressed():
	if(Global.sfx >-80):
		Global.sfx -= 10
		update_labels()
	$SFXSample.volume_db = Global.sfx
	$SFXSample.play()


func _on_sfxp_pressed():
	if(Global.sfx <=-0):
		Global.sfx += 10
		update_labels()
	$SFXSample.volume_db = Global.sfx
	$SFXSample.play()
