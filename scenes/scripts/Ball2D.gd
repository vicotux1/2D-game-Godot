extends RigidBody2D
var Brick =load("res://Assets/sounds/pelota.wav")
var Suelo =load("res://Assets/sounds/FX/error.wav")
var Sfx
export var Offset = Vector2(0,0)
export var Inpulse= Vector2(0,0)
export var Grupo= ""

export var Walls= ""
var isGaming= false
func _ready():
	start()
	Sfx= AudioStreamPlayer.new()
	
	
	
func start():
	position.x=520
	position.y=543
	

func _process(delta):
	if Input.is_action_just_pressed("Ball")&& isGaming==false:
		print("juego iniciado")
	
		apply_impulse(Offset, Inpulse)
		isGaming=true
		print("ya no puedes disparar!")

func _on_Ball2D_body_entered(body):
	if 	body.is_in_group("Piso"):
		start()	
		print("Restart")	
	if body.is_in_group(Grupo):
			print("coliciono")
			BrickPlay(Brick)
			apply_impulse(Offset/2, -Inpulse/2)
			body.queue_free()
	if 	body.is_in_group(Walls):	
		apply_impulse(Offset/4, Inpulse/4)
		print("Pared")	
	
	if 	body.is_in_group("Player"):
		apply_impulse(Offset, Inpulse)
		
		
func BrickPlay(var sound):
		Sfx.stream=sound
		Sfx.play()
		add_child(Sfx)
	
		
