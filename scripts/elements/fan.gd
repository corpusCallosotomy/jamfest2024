extends Node2D

@export var fanForce : int = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	for body in $Area2D.get_overlapping_bodies():
		if body.is_in_group("ball"):
			body.apply_central_impulse(self.transform.x * fanForce * delta)
