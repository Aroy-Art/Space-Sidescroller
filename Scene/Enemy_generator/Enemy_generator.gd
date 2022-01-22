extends Position2D

signal create_enemy(enemy, location)

export var enemy : PackedScene

onready var screen_size = OS.get_screen_size()

# On timer timeout spawn enemy.
func _on_Timer_timeout():
	randomize()
	emit_signal("create_enemy", enemy, Vector2(screen_size.x + 64, rand_range(32, 448)))
	
