extends Node

var backgrounds = []
var bgWidth
var moveSpeed = 40
var minX = -400

# Called when the node enters the scene tree for the first time.
func _ready():
	backgrounds = [$Background1,$Background2,$Background3]
	bgWidth = $Background1.texture.get_width()

