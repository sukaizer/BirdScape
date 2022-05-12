extends Node

var backgrounds = []
var bgWidth  = 600
var moveSpeed = 40
var minX = -400

# Called when the node enters the scene tree for the first time.
func _ready():
	backgrounds = [$Background1,$Background2,$Background3,$Background4,$Background5]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in range(5):
		var temp = backgrounds[i].position
		temp.x -= moveSpeed * delta
		if temp.x <= minX :
			temp.x += bgWidth * backgrounds.size()
		backgrounds[i].position = temp
