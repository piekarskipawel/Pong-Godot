#extends CharacterBody2D
#
#
#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
#
#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
extends CharacterBody2D

var speed = 400.0
var direction = Vector2(1, 1).normalized() # Piłka rusza w dół i w prawo

func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		# Zapisujemy kierunek odbicia (tzw. wektor normalny) do zmiennej
		var normal = collision.get_normal()
		
		# Odbijamy piłkę
		direction = direction.bounce(normal)
		
		# MAGIA: Natychmiastowe odepchnięcie piłki na zewnątrz, żeby się nie przykleiła!
		position += normal * 3.0 
		
		speed += 20.0 
		$BounceSound.play()
