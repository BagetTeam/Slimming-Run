extends Area2D

var velocity = Vector2()
var acceleration = Vector2()
var target
var direction

var speed = 400
var stearing_force = 75

var TimeAlive = 10

const GameOverScreen = preload("res://GameOverScreen.tscn")

func seek():
	var steer = Vector2.ZERO
	if target:
		var desired = (target.position - position).normalized() * speed
		steer = (desired - direction).normalized() * stearing_force
	return steer

func _process(delta):
	
	acceleration += seek()
	direction += acceleration * delta
	direction = direction.clamped(speed)
	position += direction * delta
	
	
	if TimeAlive > 0:
		TimeAlive -= 1*delta
	else:
		_self_destruct()

func _self_destruct():
	queue_free()


func _on_FireballHoming_body_entered(body):
	var game_over = GameOverScreen.instance()
	add_child(game_over)





#func start(_transform, _target):
#	global_transform = _transform
#	velocity = transform.x * speed
#	target = _target
	
	
#func seek():
#	var steer = Vector2.ZERO
#	if target:
#		var desired = (target.position - position).normalized() * speed
#		steer  = (desired - velocity).normalized() * stearing_force
#	return steer
	
	
#func _physics_process(delta):
#	acceleration += seek()
#	velocity += acceleration * delta
#	velocity = velocity.clamped(speed)
#	rotation = velocity.angle()
#	position += velocity * delta
#	



#func SelfDestruct():
#	queue_free()
