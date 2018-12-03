extends Area2D

signal golem_fell
signal skull_fell
signal ghost_fell

func _ready():
	connect('body_entered', self, '_on_body_entered')

func _on_body_entered(body):
	print(body.name)
	if body.is_in_group('Golem'):
		emit_signal('golem_fell')
	elif body.is_in_group('Skull'):
		emit_signal('skull_fell')
	elif body.is_in_group('Ghost'):
		emit_signal('ghost_fell')
	else:
		get_tree().reload_current_scene()