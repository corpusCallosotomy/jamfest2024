extends SubViewport

@export var myWindow : Window

var scaleFactor : float
# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_world_2d(get_tree().root.get_world_2d())

	getScaleFactor()

func getScaleFactor():
	#print(DisplayServer.screen_get_size())
	#print(DisplayServer.screen_get_size().x)
	#print(DisplayServer.screen_get_size().y)
	scaleFactor = (float(DisplayServer.screen_get_size().x) / 1152)
	#scaleFactor.y = (DisplayServer.screen_get_size().y / 648)
	
	myWindow.size *= scaleFactor
	self.size*=scaleFactor
	$Camera2D.zoom*=scaleFactor
	#$Camera2D.scaleFactor = scaleFactor
	
	
	
	#zoom *= (DisplayServer.screen_get_size() / Vector2(1152, 648))



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
