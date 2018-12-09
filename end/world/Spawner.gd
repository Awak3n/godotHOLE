extends Node2D

export var START_DELAY = 3
export var START_MIN_WAIT_TIME = 3.5

var min_wait_time = START_MIN_WAIT_TIME

func _ready():
	randomize()
	$Timer.wait_time = START_DELAY
	$Timer.start()
	

func _on_Pit_golem_fell():
	var GOLEM_ENEMY = preload('res://enemies/Golem/golemSprites/normal/EnemyNormal.tscn')
	var new_enemy = GOLEM_ENEMY.instance()
	new_enemy.connect('golem_died', self, '_on_enemy_died')
	add_child(new_enemy)

func _spawn_golem():
	var GOLEM_ENEMY = preload('res://enemies/Golem/golemSprites/normal/EnemyNormal.tscn')
	var new_enemy = GOLEM_ENEMY.instance()
	new_enemy.connect('golem_died', self, '_on_enemy_died')
	add_child(new_enemy)

func _on_Pit_ghost_fell():
	var GHOST_ENEMY = preload('res://enemies/Ghost/ghostSprites/normal/EnemyNormal.tscn')
	var new_enemy = GHOST_ENEMY.instance()
	add_child(new_enemy)
	$Timer.wait_time = 0.4
	$Timer.start()
	new_enemy = GHOST_ENEMY.instance()
	add_child(new_enemy)

func _spawn_ghost():
	var GHOST_ENEMY = preload('res://enemies/Ghost/ghostSprites/normal/EnemyNormal.tscn')
	var new_enemy = GHOST_ENEMY.instance()
	new_enemy.connect('ghost_died', self, '_on_enemy_died')
	add_child(new_enemy)

func _on_Pit_skull_fell():
	var SKULL_ENEMY = preload('res://enemies/Skull/skullSprites/normal/EnemyNormal.tscn')
	var new_enemy = SKULL_ENEMY.instance()
	new_enemy.connect('skull_died', self, '_on_enemy_died')
	add_child(new_enemy)

func _spawn_skull():
	var SKULL_ENEMY = preload('res://enemies/Skull/skullSprites/normal/EnemyNormal.tscn')
	var new_enemy = SKULL_ENEMY.instance()
	new_enemy.connect('skull_died', self, '_on_enemy_died')
	add_child(new_enemy)

func _set_wait_time():
	$Timer.wait_time = rand_range(min_wait_time, min_wait_time + min_wait_time * 0.5)
	$Timer.start()

func _on_Timer_timeout():
	var random = randi()%3
	if random == 0: 
		_spawn_ghost()
		print("Nasceu um fantasma")
	elif random == 1:
		_spawn_skull()
		print("Nasceu uma caveira")
	else:		
		_spawn_golem()
		print("Nasceu um golem")
	_set_wait_time()

func _on_enemy_died():
	print(min_wait_time)
	if min_wait_time > 0.75:
		min_wait_time = min_wait_time * 0.97
