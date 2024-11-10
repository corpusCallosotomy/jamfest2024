extends RigidBody2D

var startingposition : Vector2
var reset_state = false
# Called when the node enters the scene tree for the first time.
func _ready():
	startingposition = self.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	print("body entered")
	if body.is_in_group("spike"):
		print("it was a spike")
		reset_state = true

func _integrate_forces(state):
	if reset_state:
		state.transform = Transform2D(0.0, startingposition)
		self.linear_velocity=Vector2.ZERO
		reset_state = false

func resetme():
	reset_state = true
