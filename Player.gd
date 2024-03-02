extends CharacterBody2D


var speed = 111

var shot_timer:float = 0 
var counter = 0

func _physics_process(delta):
	shot_timer -= delta
	counter+=1
	#print(shot_timer)
	if Input.is_key_pressed(KEY_X) and shot_timer <= 0:
		print("bang " + str(counter))
		# 13 frames in pico 8 at 60fps
		# shot delay = 1/60*13
		shot_timer=13.0/60
		print(shot_timer)
		$shootfx.play()
		counter=0
	#else:
		#print("-")

	if shot_timer>0:
		speed=75
	else:
		speed = 111
		

	var direction_x = Input.get_axis("ui_left", "ui_right")
	var direction_y= Input.get_axis("ui_up", "ui_down")

	
	var movement = Vector2(direction_x, direction_y).normalized()*speed
	velocity.x = movement.x
	velocity.y = movement.y
		

	move_and_slide()
	position.x=clamp(position.x,4,123)
	position.y=clamp(position.y,4,123)
