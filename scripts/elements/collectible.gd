extends Node2D

var collected = false
var ImpactParticle = load("res://scenes/CoinParticle.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

		
func resetme():
	print("Reseting Coin")
	collected=false
	self.visible=true


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		if collected==false: 
			
			var CoinParticle = preload("res://scenes/CoinParticle.tscn")
			var instance = CoinParticle.instantiate()
			get_tree().root.add_child(instance)
			instance.global_position = self.position
			instance.emitting = true
			
			collected=true
			self.visible=false
