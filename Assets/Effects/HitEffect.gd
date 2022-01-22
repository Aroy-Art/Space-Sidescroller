extends AnimatedSprite

func _ready():
	play("Animate")

func _on_HitEffect_animation_finished():
	queue_free()
