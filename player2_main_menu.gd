extends CharacterBody2D


const SPEED = 200.0
var start_position = Vector2.ZERO

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") / 2

func die():
	self.velocity = Vector2.ZERO
	self.global_position = start_position

func _ready():
	start_position = self.global_position

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle movement
	#velocity.x = 1 * SPEED

	move_and_slide()
