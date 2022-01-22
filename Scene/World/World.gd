extends Node2D

var Dead = false
var Health = 3

onready var PlayerHealthBar = $UI/Control/PlayerHealthBar
onready var GameOver = $UI/GameOver
onready var ScoreLabel = $UI/Control/ScoreLabel
onready var Start = $UI/Start


func _ready():
	Start.show()
	GameOver.hide()
	$UI/Control.hide()
	get_tree().paused = true


func _process(_delta):
	
	ScoreLabel.set_text("Score: " + str(Globals.Score))
	
	if Health == 0:
		Dead = true
		GameOver.show()
		get_tree().paused = true
		$UI/Control.hide()
		Start.hide()


func _on_Player_create_bullet(bullet, location):
	var Bullet_instance = bullet.instance()
	add_child(Bullet_instance)
	Bullet_instance.global_position = Vector2(location.x + 64, location.y + 6)


func _on_Enemy_generator_create_enemy(enemy, location):
	var enemy_instance = enemy.instance()
	add_child(enemy_instance)
	enemy_instance.global_position = location


func _on_Player_player_damaged():
	if Dead != true:
		Health -= 1
		PlayerHealthBar.set_value(Health)


func _on_RestartButton_pressed():
	get_tree().call_group("Mobs", "queue_free")
	Health = 3
	Dead = false
	Globals.Score = 0
	PlayerHealthBar.set_value(Health)
	GameOver.hide()
	$UI/Control.show()
	get_tree().paused = false


func _on_StartButton_pressed():
	get_tree().call_group("Mobs", "queue_free")
	Health = 3
	Dead = false
	Globals.Score = 0
	PlayerHealthBar.set_value(Health)
	GameOver.hide()
	Start.hide()
	$UI/Control.show()
	get_tree().paused = false

