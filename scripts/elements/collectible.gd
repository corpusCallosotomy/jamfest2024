extends Node2D

<<<<<<< Updated upstream
=======
var collected = false
var CoinParticle = load("res://scenes/CoinParticle.tscn")
>>>>>>> Stashed changes

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

<<<<<<< Updated upstream

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"): 
		self.queue_free() # Replace with function body.
=======
	
		
func resetme():
	print("reseting coin")
	collected=false
	self.visible=true


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		if collected==false: 
			var CoinParticle = preload("res://scenes/CoinParticle.tscn")
			var instance = CoinParticle.instantiate()
			get_tree().root.add_child(instance)
			instance.global_position = self.position
			collected=true
			self.visible=false
>>>>>>> Stashed changes
