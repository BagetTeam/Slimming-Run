extends KinematicBody2D

const GameOverScreen = preload("res://LosingScreen.tscn")

const speed = 400

var facingright = true
var move_speed = 400

var player_alive = true

func _ready():
	add_to_group("PlayerArena")


func _physics_process(delta):
	
	var motion = Vector2()
	
	var screensize = get_viewport().get_visible_rect().size
	
	
	if facingright == true:
		$Sprite.scale.x = 0.5
	else:
		$Sprite.scale.x = -0.5
	
	if Input.is_action_pressed("upArena"):
		motion.y -= 1
	if Input.is_action_pressed("downArena"):
		motion.y += 1
	if Input.is_action_pressed("rightArena"):
		motion.x += 1
		facingright = true
	if Input.is_action_pressed("leftArena"):
		motion.x -= 1
		facingright = false
		
	if position.x > screensize.x:
		motion.x = 0
		position.x = screensize.x
	elif position.y > screensize.y:
		motion.y = 0
		position.y = screensize.y
	elif position.x < 0:
		motion.x = 0
		position.x = 0
	elif position.y < 0:
		motion.y = 0
		position.y = 0
	
	motion = motion.normalized()
	motion = move_and_slide(motion * speed)
	
	
	
func _on_Area2D_area_entered(area):
	
	var projectile = load("res://ArenaActors/FireballArena.tscn")
	projectile = area
	#get_tree().paused = true
	var losing = GameOverScreen.instance()
	add_child(losing)
	player_alive = false
