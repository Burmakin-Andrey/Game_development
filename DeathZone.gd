extends Area2D



func _on_DeathZone_body_entered(body):
	if body == Player:
		body.die()
