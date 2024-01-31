extends Node2D

func _ready():
	if(!MusicController.musicPlaying):
		MusicController.play_gameplay_music();
