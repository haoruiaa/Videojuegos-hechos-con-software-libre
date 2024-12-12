extends CharacterBody2D
class_name Tornado

var speed = 30
var gravity = 7
var moving_left = true

func _ready():
	$AnimationPlayer.play("Tornado")

func _process(delta):
	move_character()
	turn()
	
func move_character():
	velocity.y += gravity
	if (moving_left):
		velocity.x = -speed
		move_and_slide()
	else:
		velocity.x = speed
		move_and_slide()

func _on_area_2d_body_entered(body):
	if body.get_name() == "PJ":
		body._LoseLife()
		pass

func turn():
	if not $Area2D/RayCast2D.is_colliding():
		moving_left = !moving_left
		scale.x = -scale.x
