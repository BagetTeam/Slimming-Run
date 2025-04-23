extends CanvasLayer




func _on_MenuButton_pressed():
	get_tree().quit()


func _on_RestartButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Arena.tscn")
