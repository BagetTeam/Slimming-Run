extends CanvasLayer




func _on_RestartButton_pressed():
	get_tree().change_scene("res://world.tscn")
	get_tree().paused = false


func _on_MenuButton_pressed():
	get_tree().quit()
