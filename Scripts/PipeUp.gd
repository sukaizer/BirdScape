extends KinematicBody2D

export var speed = -50
var screen_size

signal score
var isRight = true

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("pipes")
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(speed,0) * delta
	if position.x < screen_size.x/2 && isRight:
		emit_signal("score")
		isRight = false
	elif position.x < -100 : 
		queue_free()
