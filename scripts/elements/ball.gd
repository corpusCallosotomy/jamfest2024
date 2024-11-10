extends RigidBody2D

var startingposition : Vector2
var reset_state = false

var DeathParticle = load("res://scenes/DeathParticle.tscn")
var ImpactParticle = load("res://scenes/ImpactParticle.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	startingposition = self.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	print("body entered")

	if body.is_in_group("spike") and self.is_in_group("player"):

		
		#var DeathParticle = preload("res://scenes/DeathParticle.tscn")
		var instance = DeathParticle.instantiate()
		get_tree().root.add_child(instance)
		instance.global_position = self.position
		instance.emitting = true

		print("it was a spike")
		resetme()
	else:
		#var ImpactParticle = preload("res://scenes/ImpactParticle.tscn")
		var instance = ImpactParticle.instantiate()
		get_tree().root.add_child(instance)
		instance.global_position = self.position
		instance.emitting = true

func _integrate_forces(state):
	if reset_state:
		state.transform = Transform2D(0.0, startingposition)
		self.linear_velocity=Vector2.ZERO
		reset_state = false

func resetme():
	get_tree().call_group("coin", "resetme")
	reset_state = true
