extends Area2D

var velocity = Vector2()
var speed = 500
var acceleration = Vector2()
var life_time = 3
var direction = Vector2()
var TimeAlive = 10


const GameOverScreen = preload("res://GameOverScreen.tscn")


func _process(delta):
	translate(direction*speed*delta)
	
	if TimeAlive > 0:
		TimeAlive -= 1*delta
	else:
		_self_destruct()

func _self_destruct():
	queue_free()
	

func _on_Fireball_body_entered(body):
	
	var game_over = GameOverScreen.instance()
	add_child(game_over)
	TimeAlive = 15
	
	
	
	
	
	
	
	
	
	
	



#func start(_transform, _target):
#	global_transform = _transform
#	velocity = transform.x * speed
	
	
#func _physics_process(delta):
	
#	velocity += acceleration * delta
#	velocity = velocity.clamped(speed)
#	rotation = velocity.angle()
#	position += velocity * delta
	
#func _on_Missile_body_entered(body):
#	queue_free()


#func SelfDestruct():
#	yield(get_tree().create_timer(life_time), "timeout")
#	queue_free()







#func _ready():
#	velocity.y = 300
	
#func _physics_process(delta):
#	move_and_slide(velocity)


#onready var fb = get_node("../Fireball")
#onready var obj = get_node("../Player")
#onready var enn = get_node("../Ennemi")

#var SPEED = 100
#var velocity = Vector2()
#var target = Vector2()
#var distance= 1500
#var TimeInSeconds = 5


#func _ready():
#	pass

#func _physics_process(delta):
#	target= obj.position
#	velocity = position.direction_to(target) * SPEED 
#	translate(velocity*delta)
#	move_and_collide(velocity)
	
#func _on_VisibilityNotifier2D_screen_exited():
#	queue_free()


#func _on_Missile_body_entered(body):
#	obj = body
#	queue_free()

#func _process(delta):
#	pass






#var t = 0

#var _initialPos = Vector2()
#var _finalPos = Vector2()


#func init(initialPos, finalPos):
#	_initialPos = initialPos
#	_finalPos = finalPos



#func _on_Missile_body_entered(body):
#	queue_free()

#func _process(delta):
#	t += delta/5



#export var speed = 350

#var velocity = Vector2.ZERO
#var acceleration = Vector2.ZERO

#func start(_transform):
#	global_transform = _transform
#	velocity = transform.x * speed

#func _physics_process(delta):
#	velocity += acceleration * delta
#	velocity = velocity.clamped(speed)
#	rotation = velocity.angle()
#	position += velocity * delta

#func _on_Missile_body_entered(body):
#	queue_free()

#func _on_Lifetime_timeout():
#	queue_free()

