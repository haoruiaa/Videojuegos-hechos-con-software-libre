extends CharacterBody2D
class_name Character1


var speed = 100
var direccion = 0.0
var jump = 250
var gravity = 7

var lifes = 3

var knockback = 200

func _physics_process(delta):
	handleHearts()
	velocity.x = direccion + speed
	velocity.x = direccion * speed

	direccion = Input.get_axis("left","right")
	if direccion != 0:
		$AnimationPlayer.play("walk")
	else:
		$AnimationPlayer.play("idle")
	
	$Sprite2D.flip_h = direccion < 0 if direccion != 0 else $Sprite2D.flip_h
	
	if is_on_floor() and (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("up")):
		velocity.y -= jump
	
	if !is_on_floor():
		velocity.y += gravity
	
	
	move_and_slide()

func _LoseLife():
	lifes -= 1
	if lifes <= 0:
		get_tree().reload_current_scene()

func _on_wood_stakes_body_entered(body):
	if body.get_name() == "PJ":
		body._LoseLife()


func handleHearts():
	if lifes == 3:
		$UI/Heart1.visible = true
		$UI/Heart2.visible = true
		$UI/Heart3.visible = true
	if lifes == 2:
		$UI/Heart1.visible = true
		$UI/Heart2.visible = true
		$UI/Heart3.visible = false
	if lifes == 1:
		$UI/Heart1.visible = true
		$UI/Heart2.visible = false
		$UI/Heart3.visible = false
	if lifes <= 0:
		$UI/Heart1.visible = false
		$UI/Heart2.visible = false
		$UI/Heart3.visible = false


func _on_static_body_2d_body_entered(body):
	if body.get_name() == "PJ":
		get_tree().change_scene_to_file("res://Recursos/Escenas/2world.tscn")


