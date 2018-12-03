extends TextureRect

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var score = 0

func _ready():
	print(score)
	get_node("Label").set_text(str(score))

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Ghost_ghost_died():
	score = score + 5
	_ready()


func _on_Skull_skull_died():
	score = score + 5
	_ready()


func _on_Golem_golem_died():
	score = score + 5
	_ready()
