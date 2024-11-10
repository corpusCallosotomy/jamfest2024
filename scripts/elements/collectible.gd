extends Node2D

var collected = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		if collected==false: 
			collected=true
			$Area2D.visible=false
		
func resetme():
	collected=false
	$Area2D.visible=true
