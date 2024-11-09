extends Node2D

@export var fanForce : int = 100

@export var minimumPoint : float = self.position.y-167.5
@export var maximumPoint : float = self.position.y+167.5

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.position.y = maximumPoint + (minimumPoint-maximumPoint) * $VSlider.value/100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	for body in $Area2D.get_overlapping_bodies():
		if body.is_in_group("ball"):
			body.apply_central_impulse(self.transform.x * fanForce * delta)


func _on_v_slider_value_changed(value):
	# get number value% between minimum and maximum
	$Area2D.position.y = maximumPoint + (minimumPoint-maximumPoint) * value/100
