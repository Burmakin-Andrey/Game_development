extends RigidBody2D


enum BirdState{
	notThrown,
	thrown
}
var state = BirdState.notThrown

func _ready():
	mode = RigidBody2D.MODE_KINEMATIC

func ThrowBird():
	mode = RigidBody2D.MODE_RIGID
	state = BirdState.thrown

func _physics_process(delta):
	if state == BirdState.thrown && linear_velocity <= Vector2(2,2):
		var t = Timer.new()
		t.set_wait_time(2)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		var slingshot = get_tree().get_nodes_in_group("Slingshot")[0]
		slingshot.slingShotState = slingshot.SlingState.reset
		queue_free()
	pass
