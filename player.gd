extends KinematicBody

const ROTATION = 1
const GRAVITY = -10
const SPEED = 1
var velocity = Vector3()

func _process(delta):
	var dir = Vector3()
	
	if Input.is_action_pressed("ui_left"):
		rotate_y(ROTATION * delta)
	
	if Input.is_action_pressed("ui_right"):
		rotate_y(-ROTATION * delta)
	
	if Input.is_action_pressed("ui_up"):
		dir.z = -1
	
	if Input.is_action_pressed("ui_down"):
		dir.z = 1
	
	if dir:
		translate(SPEED * dir * delta)
		dir = dir.rotated(Vector3(0, 1, 0), rotation.y)
		
	velocity.x = dir.x
	velocity.z = dir.z

	velocity.y += GRAVITY * delta
	move_and_slide(velocity, Vector3(0, 1, 0))
