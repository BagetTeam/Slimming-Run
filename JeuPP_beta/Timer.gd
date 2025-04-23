extends Label



var time = 30



func _process(delta):
	if time > 0:
		time -= delta
	else:
		time = 0
		
		
	text = var2str(time)
	

func _ready():
	pass 
