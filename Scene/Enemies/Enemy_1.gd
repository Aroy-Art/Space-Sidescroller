extends Sprite

export(int, 100, 1) var speed = 50
export var HITEFFECT_SCENE: PackedScene

func _process(delta):
	# Enemy movment
	global_position.x -= speed * delta
	
	# Delete enemy if of screen
	if global_position.x < -400:
		Globals.Misses += 1
		queue_free()


# Remove enemy if hit by player bullet and add hiteffect
func _on_Area2D_area_entered(area):
	# Check if is hit by player bullet and remove.
	if area.is_in_group("Enemy_damager"):
		queue_free()
		Globals.Score += 1
		
		# Remove bullet if hit 
		if area.get_parent() is Sprite:
			area.get_parent().queue_free()
		
		# Add hiteffect.
		var hiteffect = HITEFFECT_SCENE.instance()
		get_parent().add_child(hiteffect)
		hiteffect.global_position = global_position

