extends Sprite

export(int, 1000, 500) var Bullet_Speed = 1000
export(int, 20, 1) var BULLET_LIFETIME = 3

#Start bullet lifetime timer
func _ready():
	$Timer.start(BULLET_LIFETIME)

# Bullet movement
func _process(delta):
	global_position.x += Bullet_Speed * delta

# Delite bullert after timer timeout
func _on_Timer_timeout():
	queue_free()

