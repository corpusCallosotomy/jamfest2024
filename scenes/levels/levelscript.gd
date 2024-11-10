extends Node2D


var levelAddressHeader : String = "res://scenes/levels/"
@export var nextLevelAddress: String = "level_2"
var fullNextScene : PackedScene

var nightVisionArray = preload("res://scenes/nightvisionarray_healed.tscn")
@export var NV_start_position : Vector2

var NVGinstance : Node

var levelChanging = false

# Called when the node enters the scene tree for the first time.
func _ready():
	levelChanging=false
	var nextSceneAddress = levelAddressHeader+nextLevelAddress+".tscn"
	fullNextScene = load(nextSceneAddress)#.instance()
	
	await get_tree().create_timer(1).timeout
	NVGinstance = nightVisionArray.instantiate()
	add_child(NVGinstance)
	
	NVGinstance.startingPosition=NV_start_position
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func killLevel():
	if levelChanging: return
	levelChanging = true
	NVGinstance.queue_free()
	await get_tree().create_timer(1).timeout
	var nextSceneInstance = fullNextScene.instantiate()
	get_tree().root.add_child(nextSceneInstance)
	queue_free()


func _on_finish_level_complete():
	
	killLevel()


func _on_finish_title_pressed():
	if levelChanging: return
	levelChanging = true
	NVGinstance.queue_free()
	#await get_tree().create_timer(1).timeout
	var menuInstance = load("res://scenes/menus/Menu.tscn").instantiate()
	get_tree().root.add_child(menuInstance)
	queue_free()
	
