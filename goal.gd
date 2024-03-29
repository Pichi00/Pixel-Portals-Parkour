extends Area2D

@export var targetScene: PackedScene

func _on_body_entered(_body):
	MusicController.play_goal_sound()
	if not targetScene is PackedScene: return
	get_tree().paused = false
	get_tree().change_scene_to_packed(targetScene)
