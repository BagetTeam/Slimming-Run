extends Area2D

var velocity = Vector2()
var speed = 350
var acceleration = Vector2()
var life_time = 3
var direction = Vector2()
var TimeAlive = 5


const GameOverScreen = preload("res://GameOverScreen.tscn")


func _process(delta):
	translate(direction*speed*delta)
	
	if TimeAlive > 0:
		TimeAlive -= 1*delta
	else:
		_self_destruct()

func _self_destruct():
	queue_free()
	



