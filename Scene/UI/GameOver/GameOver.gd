extends Control

onready var ScoreLabel = $ScoreLabel
onready var MissLabel = $MissLabel

func _process(_delta):
	ScoreLabel.set_text("Score: " + str(Globals.Score))
	MissLabel.set_text("Misses: " + str(Globals.Misses))
