extends Node2D

signal obstacle_created(obs)

onready var timer = $SpawnTimer
var obstacles = preload("res://Obstacle.tscn")
	
func start():
	timer.start()
	
func stop():
	timer.stop()
 
func _ready():
	randomize()

func spawn():
	var new_obscle = obstacles.instance()
	add_child(new_obscle)
	new_obscle.position.y = randi() % 450 - 125
	emit_signal("obstacle_created", new_obscle)

func _on_SpawnTimer_timeout():
	spawn()
