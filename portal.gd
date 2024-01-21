extends Node2D

var portalExit

func _ready():
	portalExit = self.get_node("PortalExit")

func _onBodyEntered(body:Node2D):
	body.global_position.x = portalExit.global_position.x
	body.global_position.y = portalExit.global_position.y
