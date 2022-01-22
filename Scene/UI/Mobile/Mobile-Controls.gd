extends CanvasLayer


func _on_TouchScreenButton_pressed():
	Input.action_press("Shoot")


func _on_Control_mouse_entered():
	print("mouse_in = true")
	Globals.mouse_in = true


func _on_Control_mouse_exited():
	print("mouse_in = false")
	Globals.mouse_in = false
