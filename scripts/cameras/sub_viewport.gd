extends SubViewport

@export var myWindow : Window

# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_world_2d(get_tree().root.get_world_2d())

	getScaleFactor()

func getScaleFactor():
	#print(DisplayServer.screen_get_size())
	var scaleFactor = (DisplayServer.screen_get_size() / Vector2i(1152, 648))
	print(scaleFactor)
	print(DisplayServer.screen_get_size())
	print(DisplayServer.screen_get_size() / Vector2i(1152, 648))
	myWindow.size *= scaleFactor
	
	
	
	#zoom *= (DisplayServer.screen_get_size() / Vector2(1152, 648))



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
