extends KinematicBody2D

#Load bullet player bullet scene
export var Bullet: PackedScene

onready var screen_size = get_viewport().size

signal create_bullet(bullet, location)

signal player_damaged()

func _process(_delta):
	# Player movment, follow the mouse
	print(get_viewport().get_mouse_position())
	
	global_position.y = lerp(global_position.y,get_viewport().get_mouse_position().y, 0.2)
	
	
	#Emit signal to create a bullet.
	if Input.is_action_just_pressed("Shoot"):
		emit_signal("create_bullet", Bullet, global_position)


func _on_Area2D_area_entered(area):
	if area.is_in_group("Player_damager"):
		emit_signal("player_damaged")

