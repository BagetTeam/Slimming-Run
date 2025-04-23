extends KinematicBody2D

const GameOverScreen = preload("res://GameOverScreen.tscn")
onready var player = get_node("../Player")

const arena_scene = preload("res://Arena.tscn")


const UP = Vector2(0, -1)
const GRAVITY = 100
const MAXFALLSPEED = 5000
const MAXMOVESPEED = 500
const JUMPFORCE = 2000
const ACCEL = 100

var motion = Vector2()
var facing_right = true 

# ou
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	motion.y += GRAVITY
	
	
	if motion.y > MAXFALLSPEED: 
		motion.y = MAXFALLSPEED
		
		
	if facing_right == true:
		$Sprite.scale.x = 1
		
	else:
		$Sprite.scale.x = -1
	
	
	motion.x = clamp(motion.x, -MAXMOVESPEED, MAXMOVESPEED)
	
	
	if Input.is_action_pressed("right"):
		
		motion.x += ACCEL
		facing_right = true
		$AnimationPlayer.play("Run")
		
	elif Input.is_action_pressed("left"):
		motion.x -= ACCEL
		facing_right = false
		$AnimationPlayer.play("Run")
		
	else:
		motion.x = lerp(motion.x,0,0.2)
		$AnimationPlayer.play("Idle")
		
		
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMPFORCE
			
	if !is_on_floor():
			$AnimationPlayer.play("Jump")
		
		
	motion = move_and_slide(motion, UP)
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("ennemies"):
			player_lost()
		if collision.collider.name.begins_with("Fireball"):
			print("oof")
		if collision.collider is Area2D:
			print("lol L")
	pass
	portal()
	die()
	

func spawn_player():
	pass


func die():
	var projectile = load("res://Actors/Fireball.tscn")
	var fireball = projectile.instance()
	
	if player.position.y > 5000:
		player_lost()
	


func player_win():
	var game_over = GameOverScreen.instance()
	add_child(game_over)
	#game_over.set_title = true
	
	
	
func player_lost():
	var game_over = GameOverScreen.instance()
	add_child(game_over)
	#game_over.set_title = false
	
func portal():
	if player.position.x > 18500:
		var arena = arena_scene.instance()
		get_tree().change_scene("res://Arena.tscn")
		hide()
	
	

func _on_PlayerArea_area_entered(area):
	pass
