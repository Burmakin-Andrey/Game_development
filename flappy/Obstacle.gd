extends Node2D

signal score

var speed = -500

func _physics_process(delta):
	position.x += speed * delta
	if global_position.x <= -275:
		queue_free()

func _on_Wall_body_entered(body):
	if body is Player:
		body.die()


func _on_ScoreArea_body_exited(body):
	emit_signal("score")
