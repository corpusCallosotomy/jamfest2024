extends Area2D

@export var thisLevelName: String
@export var nextLevelAddress: PackedScene

@export var dimmer: CanvasModulate

#@export var mainmenu: PackedScene

var pressed = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		$options.global_position = Vector2(576, 150)
		$options.visible = !$options.visible


func _on_body_entered(body):
	if pressed: return
	if body.is_in_group("ball"):
		pressed=true
		print("A WINNER IS YOU")
		
		var tween = get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_ELASTIC)
		tween.tween_property(dimmer, "color", Color(1,1,1,1), 1)
		
		$winscreen.global_position=Vector2(576, 324)
		$winscreen.visible=true
		


func _on_button_pressed():
	#get_tree().change_scene_to_packed(nextLevelAddress)
	
	get_tree().change_scene_to_packed(nextLevelAddress)
	#get_parent().queue_free()



func _on_resume_pressed():
	$options.visible=false


func _on_title_pressed():
	get_tree().change_scene_to_packed(load("res://scenes/menus/Menu.tscn"))
	#get_parent().queue_free()
