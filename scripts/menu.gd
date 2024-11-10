extends Node2D

@export var Menu : Node2D  
@export var LevelSelect : Node2D  
@export var Credits : Node2D

@export var lvl1 : PackedScene
@export var lvl2 : PackedScene
@export var lvl3 : PackedScene
@export var lvl4 : PackedScene

@export var buttonSFX : AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_level_1_texture_button_pressed() -> void:
	buttonSFX.playing = true
	#var lvl1instance = lvl1.instantiate()
	#get_tree().root.add_child(lvl1instance)
	#queue_free()
	get_tree().change_scene_to_packed(lvl1)# Replace with function body.


func _on_level_2_texture_button_pressed() -> void:
	buttonSFX.playing = true
	get_tree().change_scene_to_packed(lvl2)


func _on_level_3_texture_button_pressed() -> void:
	buttonSFX.playing = true
	get_tree().change_scene_to_packed(lvl3)


func _on_level_4_texture_button_pressed() -> void:
	buttonSFX.playing = true
	get_tree().change_scene_to_packed(lvl4)
