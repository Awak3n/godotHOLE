extends TextureRect

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var score = 0 setget set_score

func _ready():
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func set_score(new_value):
	score = new_value
	get_node("label").set_text(str(score))
	print(score)
	

func _on_Ghost_ghost_died():
	score = score + 5
	print("Morreu")
	set_score(score)


func _on_Skull_skull_died():
	score = score + 5
	set_score(score)


func _on_Golem_golem_died():
	score = score + 5
	set_score(score)
