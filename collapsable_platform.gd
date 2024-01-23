extends StaticBody2D

@export var initialWaitTime = 0.5
@export var initialRespawnTime = 2

func _ready():
	$Timer.wait_time = initialWaitTime
	$RespawnTimer.wait_time = initialRespawnTime

func _on_timer_timeout():
	$CollisionShape2D.disabled = true
	$Area2D/CollisionShape2D.disabled = true
	$Icon.visible = false
	$RespawnTimer.start()


func _on_regenerate_timer_timeout():
	$CollisionShape2D.disabled = false
	$Area2D/CollisionShape2D.disabled = false
	$Icon.visible = true


func _on_area_2d_body_entered(body):
	$Timer.start()
