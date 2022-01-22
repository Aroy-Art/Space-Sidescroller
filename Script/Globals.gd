extends Node

var UI_MOBILE_SCENE = preload("res://Scene/UI/Mobile/Mobile-Controls.tscn")

var has_touchscreen = false
var mouse_in = false

var Score = 0
var Misses = 0

func _ready():
	if OS.has_touchscreen_ui_hint():
		has_touchscreen = true
		var mobileControls = UI_MOBILE_SCENE.instance()
		add_child(mobileControls)
