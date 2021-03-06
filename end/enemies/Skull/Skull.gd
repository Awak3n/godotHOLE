extends KinematicBody2D

export var SPEED = 250
export var MAX_HEALTH = 50
export var GRAVITY = 500

var direction = 0
var motion = Vector2()
var health = MAX_HEALTH

signal skull_died

func _ready():
	randomize()
	direction = 1 if rand_range(0, 100) > 50 else -1
	_update_sprite_direction()
	motion.y = GRAVITY
	add_to_group("Skull")

func _physics_process(delta):
	motion.x = SPEED * direction
	move_and_slide(motion, Vector2(0, -1))

func damage(value):
	health -= value
	if health <= 0:
		emit_signal('skull_died')
		queue_free()

func _on_DirectionCheck_body_entered(body):
	if is_on_floor() and body is TileMap:
		direction = -direction
		_update_sprite_direction()
	elif body.name == "Player":
		get_tree().reload_current_scene()

func _update_sprite_direction():
	$AnimatedSprite.flip_h = direction == -1

func _on_Timer_timeout():
	pass
