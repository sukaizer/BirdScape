extends Area2D


export var speed = -50
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	$AnimatedSprite.play()
	position += Vector2(speed,0) * delta
	if position.x < -100 : 
		queue_free()


func _on_Shell_body_entered(body):
	GameManager.Player.add_shell()
	queue_free()
