extends Node2D

const winningScreen = preload("res://WinningScreen.tscn")
const timer_scene = preload("res://Timer.tscn")
onready var player_arena = get_node("ArPlayer")

var time = 30
var timer = 2

func spawn():
	var rand = RandomNumberGenerator.new()
	var ennemi_scene = load("res://ArenaActors/EnnemiArena.tscn")
	var ennemi = ennemi_scene.instance()
	var screensize = get_viewport().get_visible_rect().size
	
	rand.randomize()
	var x = rand.randf_range(0, screensize.x)
	rand.randomize()
	var y = rand.randf_range(0, screensize.y)
	ennemi.position.x = x
	ennemi.position.y = y
	add_child(ennemi)

func _process(delta):
	if timer > 0:
		timer -= 1*delta
	else:
		spawn()
		timer = 2
		
	if time > 0:
		time -= 1*delta
	else:
		if player_arena.player_alive == false:
			print("L bozo xd")
		else:
			var winning_scene = winningScreen.instance()
			add_child(winning_scene)


func _on_Arena_ready():
	var timescene = timer_scene.instance()
	add_child(timescene)
