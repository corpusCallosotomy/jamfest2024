extends Area2D

@export var SFXName: String
var SFXIndex: int
@export var MusName: String
var MusIndex: int


@export var thisLevelAddress: String = "level_1"
var levelAddressHeader : String = "res://scenes/levels/"
var fullLevelAddress : String

@export var nextLevelAddress: PackedScene

@export var dimmer: CanvasModulate

@export var buttonSFX : AudioStreamPlayer

#@export var mainmenu: PackedScene

var pressed = false
# Called when the node enters the scene tree for the first time.
func _ready():
	BGM.lockIn()
	
	
	SFXIndex = AudioServer.get_bus_index(SFXName)
	MusIndex = AudioServer.get_bus_index(MusName)
	
	$options/HSlider.value = db_to_linear(AudioServer.get_bus_volume_db(MusIndex))
	$options/HSlider2.value = db_to_linear(AudioServer.get_bus_volume_db(SFXIndex))
	
	$reset/TextureButton.modulate=Color(1,1,1,0.1)
	
	fullLevelAddress = levelAddressHeader+thisLevelAddress+".tscn"
	
	#await get_tree().create_timer(10).timeout
	#$reset/TextureButton.disabled=false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		#$options.global_position = Vector2(576, 150)
		$options.visible = !$options.visible
		
		#dimmer.visible = !dimmer.visible

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
	#dimmer.visible=true
	buttonSFX.playing = true


func _on_title_pressed():
	get_tree().change_scene_to_packed(load("res://scenes/menus/Menu.tscn"))
	#get_parent().queue_free()


func _on_h_slider_value_changed(value: float) -> void:
	# This is the music slider
	AudioServer.set_bus_volume_db(MusIndex,value)


func _on_h_slider_2_value_changed(value: float) -> void:
	# This is the SFX Slider
	AudioServer.set_bus_volume_db(SFXIndex,value)


func _on_texture_button_mouse_entered():
	var tween = get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_EXPO)
	tween.tween_property($reset/TextureButton, "modulate", Color(1,1,1,1), 0.3)


func _on_texture_button_mouse_exited():
	var tween = get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_EXPO)
	tween.tween_property($reset/TextureButton, "modulate", Color(1,1,1,0.1), 0.3)


func _on_texture_button_pressed():
	get_tree().call_group("ball", "resetme")
	get_tree().call_group("coin", "resetme")
