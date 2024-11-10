extends Node2D

@export var fanForce : int = 100

#@export var minimumPoint : float = self.position.y-167.5
#@export var maximumPoint : float = self.position.y+167.5

@export var minimumPoint : float = -167.5
@export var maximumPoint : float = 167.5



@export var influenceLength : float = 240

@export var has_slider: bool = true

@export var sliderStartValue : float = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$VSlider.size.y = maximumPoint-minimumPoint
	$VSlider.position.y=-.5*$VSlider.size.y
	
	$VSlider.value=sliderStartValue
	
	$Area2D/CollisionShape2D.position.x = influenceLength/2
	$Area2D/CollisionShape2D.shape.size.x = influenceLength
	
	$Area2D/GPUParticles2D.lifetime=influenceLength*(.3/240)
	if fanForce<0:
		$Area2D/GPUParticles2D.position.x+=influenceLength-234
	
	$Area2D.position.y = maximumPoint + (minimumPoint-maximumPoint) * $VSlider.value/100
	$VSlider.visible = has_slider
	$Area2D/PointLight2D.visible = has_slider


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	for body in $Area2D.get_overlapping_bodies():
		if body.is_in_group("ball"):
			body.apply_central_impulse(self.transform.x * fanForce * delta)


func _on_v_slider_value_changed(value):
	# get number value% between minimum and maximum
	$Area2D.position.y = maximumPoint + (minimumPoint-maximumPoint) * value/100
