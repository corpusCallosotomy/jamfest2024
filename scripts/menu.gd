extends Node2D

@export var lvl1: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:

	get_tree().root.add_child(lvl1.instantiate())
	queue_free()



func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Credits.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu.tscn")


func _on_level_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://test.tscn")


func _on_level_2_button_pressed() -> void:
	get_tree().change_scene_to_file("res://test.tscn")


func _on_level_3_button_pressed() -> void:
	get_tree().change_scene_to_file("rres://test.tscn")


func _on_level_4_button_pressed() -> void:
	get_tree().change_scene_to_file("res://test.tscn")
