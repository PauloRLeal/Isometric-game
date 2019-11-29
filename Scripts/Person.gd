extends KinematicBody2D

var direction = Vector2()

export (int, 1, 500) var velocidade = 100
var motion = Vector2()

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	direction = Vector2()
	
	if Input.is_action_pressed("move_up"):
		direction += Vector2(0, -1)
	elif Input.is_action_pressed("move_bottom"):
		direction += Vector2(0, 1)
	
	if Input.is_action_pressed("move_left"):
		direction += Vector2(-2, 0)
	elif Input.is_action_pressed("move_right"):
		direction += Vector2(2, 0)
		
	if get_position().x < 270:
		position.x = 270
	elif get_position().x > 1140:
		position.x = 1140
	if get_position().y < 270:
		position.y = 270
	elif get_position().y > 780:
		position.y = 780
			
	motion = direction.normalized() * velocidade * delta
# warning-ignore:return_value_discarded
	move_and_collide(motion)
		
	
func cartesian_to_isometric(cartesian):
	return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y) / 2)
