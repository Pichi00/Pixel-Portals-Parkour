extends Node2D

var portalExit
var portalSwitch
@export var disabled = false

func _ready():
	$PortalEntry/CollisionShape2D.disabled = disabled
	portalExit = $PortalExit

func _onPortalBodyEntered(body:Node2D):
	body.velocity = Vector2.ZERO
	body.global_position = portalExit.global_position
	

func _onSwitchBodyEntered(_body:Node2D):
	$PortalSwitch/Icon.self_modulate = Color(0, 1, 0, 1)
	$PortalEntry/CollisionShape2D.set_deferred("disabled", false)
