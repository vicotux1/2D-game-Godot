extends KinematicBody2D

export (int) var Speed = 2
export(int) var grabity= 3000
export (String) var LeftButton= "Left"
export (String) var RightButton= "Right"
export (String) var JumpButton= "Jump"
var Offset = Vector2(0,0)
export var JumpForce= Vector2(0,0)
var Jump =load("res://sounds/pelota.wav")
var Points =load("res://sounds/FX/point.wav")
var velocity=Vector2()
var isGaming= false

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed(LeftButton):
		velocity.x -= 1
		$AnimatedSprite.stop()
		$AnimatedSprite.play("NinjaRun")
		$AnimatedSprite.flip_h=true
	elif Input.is_action_pressed(RightButton):
		#print("hola")
		velocity.x += 1
		$AnimatedSprite.stop()
		$AnimatedSprite.play("NinjaRun")
		$AnimatedSprite.flip_h=false
	else: 
		#print("hola")
		$AnimatedSprite.play("NinjaIdle")
	velocity.y= grabity
	velocity = velocity.normalized() * Speed
	velocity = move_and_slide(velocity)	

func _ready():
	#isGaming=true
	pass 

func _Jump():
	if Input.is_action_just_pressed(JumpButton) && isGaming== true:
		move_and_slide(JumpForce)
		isGaming=false
	#pass

func _physics_process(delta):
	get_input()
	_Jump()
	
func _on_RigidBody2D_body_entered(body):
	if 	body.is_in_group("Player"):
		isGaming=true
		print(isGaming)

func _on_RigidBody2D_body_exited(body):
	if 	body.is_in_group("Player"):
		isGaming=false 
		print(isGaming)
