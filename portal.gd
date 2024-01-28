extends Node2D

var portalExit
var portalSwitch
@export var disabled = false
@export var color:Color = Color.BLUE

func _ready():
	_initiate()
	portalExit = $PortalExit

func _onPortalBodyEntered(body:Node2D):
	body.velocity = Vector2.ZERO
	body.global_position = portalExit.global_position
	

func _onSwitchBodyEntered(_body:Node2D):
	if(disabled):
		disabled = false
		$PortalSwitch/Icon.play("switch")
		$PortalEntry/CollisionShape2D.set_deferred("disabled", disabled)
		$PortalEntry/Particles.emitting = !disabled
		$PortalExit/Particles.emitting = !disabled

func _initiate():
	$PortalEntry/CollisionShape2D.disabled = disabled
	$PortalEntry/Particles.emitting = !disabled
	$PortalExit/Particles.emitting = !disabled
	for child in get_children():
		child.get_child(0).self_modulate = color
	$PortalEntry/Particles.color = color
	$PortalExit/Particles.color = color
