extends Node2D

var first_player

onready var ennemi = get_node("../KinematicBody2D")

var arena = load("res://Arena.tscn")


var fireball_position
var player_position
var ennemi_position
var distance
var player_in_sight
var fire_direction

var TimeInSeconds = 3



func _process(delta):
	var player = get_tree().get_nodes_in_group("PlayerArena")
	
	if (player.count(0)):
		print("L bozo no players found")
	else:
		first_player = player[0]
		
		player_position = first_player.get_global_position()
		ennemi_position = get_position_in_parent()
		
		
	if TimeInSeconds > 0:
		TimeInSeconds -= 1*delta
	else:
		_shoot_fireball()
		TimeInSeconds = 3
		
	

func _shoot_fireball():
	
	var player = get_tree().get_nodes_in_group("PlayerArena")
	first_player = player[0]
	#var ennemi = ennemi_scene.instance()
	
	
	var projectile = load("res://ArenaActors/FireballArena.tscn")
	var fireball = projectile.instance()
	
	fireball.position = position
	get_parent().add_child(fireball)
	var dir = (player_position - global_position).normalized()
	fireball.global_rotation = dir.angle() + PI / 2.0
	fireball.direction = dir
	
	
