extends Node2D

@export var Menu : Node2D  
@export var LevelSelect : Node2D  
@export var Credits : Node2D

@export var lvl1 : PackedScene
@export var lvl2 : PackedScene
@export var lvl3 : PackedScene
@export var lvl4 : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	LevelSelect.show()
	Menu.hide()
	Credits.hide()

func _on_credits_button_pressed() -> void:
	Credits.show()
	Menu.hide()
	LevelSelect.hide()

func _on_back_button_pressed() -> void:
	Menu.show()
	LevelSelect.hide()
	Credits.hide()

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_level_1_button_pressed() -> void:
	#var lvl1instance = lvl1.instantiate()
	#get_tree().root.add_child(lvl1instance)
	#queue_free()
	get_tree().change_scene_to_packed(lvl1)


func _on_level_2_button_pressed() -> void:
	get_tree().root.add_child(lvl2.instantiate())
	queue_free()


func _on_level_3_button_pressed() -> void:
	get_tree().root.add_child(lvl3.instantiate())
	queue_free()


func _on_level_4_button_pressed() -> void:
	get_tree().root.add_child(lvl4.instantiate())
	queue_free()
