extends Node2D

var portalExit
var portalSwitch
@export var disabled = false

func _ready():
	$PortalEntry/CollisionShape2D.disabled = disabled
	portalExit = $PortalExit
	portalSwitch = $PortalSwitch

func _onPortalBodyEntered(body:Node2D):
	body.global_position.x = portalExit.global_position.x
	body.global_position.y = portalExit.global_position.y

func _onSwitchBodyEntered(body:Node2D):
	$PortalEntry/CollisionShape2D.set_deferred("disabled", false)
