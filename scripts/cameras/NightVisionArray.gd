extends Node2D

var scaleFactor : float

var startingPosition : Vector2 = Vector2(300,300)

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$SubViewport.set_world_2d(get_tree().root.get_world_2d())


	scaleFactor = (float(DisplayServer.screen_get_size().x) / 1152)	
	$NightVision.size *= scaleFactor
	$SubViewport.size*=scaleFactor
	$SubViewport/Camera2D.zoom*=scaleFactor
	$NightVision/ColorRect.size*=scaleFactor
	$NightVision/CamOverlay.scale*=scaleFactor

	
	$SubViewport/Camera2D.pause()
	await get_tree().create_timer(.5).timeout
	#$SubViewport.subViewportBootup()
	$SubViewport/Camera2D.startingPosition=startingPosition
	$SubViewport/Camera2D.unpause()
	$SubViewport/Camera2D.visible=true
	$SubViewport/Camera2D.bootup()
	$NightVision.visible=true
	
	setupViewportTexture()
	



func setupViewportTexture():
	$NightVision/Sprite2D.texture = $SubViewport.get_texture()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
