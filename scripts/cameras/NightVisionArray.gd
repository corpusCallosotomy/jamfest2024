extends Node2D

@export var startingPosition : Vector2 = Vector2(300,300)

# Called when the node enters the scene tree for the first time.
func _ready():
	$SubViewport/Camera2D.startingPosition=startingPosition
	$SubViewport/Camera2D.bootup()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
