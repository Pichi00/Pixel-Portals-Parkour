extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -370.0
var start_position = Vector2.ZERO

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var queuedJump = false


func _ready():
	start_position = self.global_position
	$DieSound.volume_db = Global.sfx

func die():
	self.velocity = Vector2.ZERO
	self.global_position = start_position
	$DieSound.play()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	elif queuedJump:
		jump()
	else:
		$DelayedJumpTimer.start()

	# Handle Jump.
	if Input.is_action_just_pressed("ui_up"):
		if (is_on_floor() or not $DelayedJumpTimer.is_stopped()) :
			jump()
		else:
			$JumpInputBufferingTimer.start()
			queuedJump = true

	# Handle movement
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func jump():
	$DelayedJumpTimer.stop()
	velocity.y = JUMP_VELOCITY
	print($DelayedJumpTimer.time_left)

func _on_jump_input_buffering_timer_timeout():
	queuedJump = false
