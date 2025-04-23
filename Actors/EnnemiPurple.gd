extends KinematicBody2D


onready var ennemi = get_node("../Ennemi")

onready var player = get_node("../Player")


const MOVESPEED = 150
const FALLSPEED = 300
const UP = Vector2(0, 1)
var motion = Vector2()

var fireball_position
var player_position
var ennemi_position
var distance
var player_in_sight
var fire_direction

var state = "Idle"


var TimeInSeconds = 1


var time = 0
var timeDirection = 1
var moveDuration = 2



func _physics_process(delta):
	if !is_on_floor():
		motion.y = FALLSPEED
	else:
		motion.y = 0
		
	motion = move_and_slide(motion, UP)
	
func _process(delta):
	
	if player_in_sight == true:
		player_position = player.get_global_position()
		ennemi_position = get_global_position()
		if TimeInSeconds > 0:
			TimeInSeconds -= 1*delta
		else:
			_shoot_fireball()
			TimeInSeconds = 3
	else:
		pass
	AttackRange()

func AttackRange():
	player_position = player.get_global_position()
	ennemi_position = get_global_position()
	
	distance = ennemi_position.distance_to(player.get_global_position())
	if distance < 1500:
		player_in_sight = true
		
	else:
		player_in_sight = false
		


func _shoot_fireball():
	
	fire_direction = (get_angle_to(player_position)/3.14)*180
	var projectile = load("res://Actors/FireballHoming.tscn")
	var fireball = projectile.instance()
	
	fireball.position = get_global_position()
	get_parent().add_child(fireball)
	var dir = (player.global_position - global_position).normalized()
	fireball.global_rotation = dir.angle() + PI / 2.0
	fireball.direction = dir
	fireball.target = player
