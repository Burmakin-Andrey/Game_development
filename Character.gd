extends RigidBody2D
class_name Player

signal died

onready var animator = $AnimationPlayer
onready var hit = $Hit


export var up_force = -300
var started = false
var launch = false
var alive = true


func _physics_process(_delta):
	if Input.is_action_just_pressed("flap") and alive:
		if !started:
			start()
		flap()
		animator.play("fall")
		
	
		
	if linear_velocity.y < 0:
		if rotation_degrees > -5:
			angular_velocity = -1
		else:
			angular_velocity = 0
		
	if linear_velocity.y > 0:
		if rotation_degrees <= 10:
			angular_velocity = 0.5
		else:
			angular_velocity = 0
				
		#animator.play("fall")

func start():
	if started: 
		return
	started = true
	gravity_scale = 5.0

func flap():
	linear_velocity.y = up_force
	animator.play("flap")

func die():
	if !alive:
		return
	alive = false
	animator.stop()
	emit_signal("died")
	hit.play()
	print("died")
	
