extends Node


var music = load("res://audio/music/gameplay.wav")
var goalSound = load("res://audio/sfx/goal.wav")
var musicPlaying = false


func play_gameplay_music():
	$Music.volume_db = Global.music
	$Music.stream = music
	$Music.play()
	musicPlaying = true
	
func stop_gameplay_music():
	$Music.stop()
	musicPlaying = false
	

func play_goal_sound():
	$GoalSound.stream = goalSound
	$GoalSound.volume_db = Global.sfx
	$GoalSound.play()

func _on_music_finished():
	if(musicPlaying):
		play_gameplay_music()
