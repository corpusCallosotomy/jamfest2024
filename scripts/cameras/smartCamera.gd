extends Camera2D

@export var isStatic : bool = false
@export var myWindow : Window

var startingPosition: Vector2 #= Vector2(300,300)

var lastPosition : Vector2i

var scaleFactor: float
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#scaleFactor = (float(DisplayServer.screen_get_size().x) / 1152)
	
	#self.position=startingPosition
	#myWindow.position=startingPosition+Vector2(35,35)
	#myWindow.position=startingPosition+Vector2(float(21*scaleFactor),float(21*scaleFactor))
	
	#print(float(21)*scaleFactor)
	#lastPosition = myWindow.position

func bootup():
	scaleFactor = (float(DisplayServer.screen_get_size().x) / 1152)
	self.position=startingPosition
	#myWindow.position=startingPosition+Vector2(35,35)
	myWindow.position=startingPosition+Vector2(float(21*scaleFactor),float(21*scaleFactor))
	
	#print(float(21)*scaleFactor)
	lastPosition = myWindow.position



func pause():
	process_mode = PROCESS_MODE_DISABLED

func unpause():
	process_mode = PROCESS_MODE_INHERIT



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if isStatic: return
	if myWindow.position==lastPosition: return
	
	var newCamPosition = self.position + Vector2((myWindow.position.x-lastPosition.x), (myWindow.position.y-lastPosition.y)) / scaleFactor
	self.position=newCamPosition
	#self.position += Vector2((myWindow.position.x-lastPosition.x), (myWindow.position.y-lastPosition.y)) / scaleFactor
	
	#self.position==Vector2(myWindow.position.x, myWindow.position.y)
	
	lastPosition = myWindow.position
	
	
