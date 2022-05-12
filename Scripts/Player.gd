extends KinematicBody2D

export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

export (int) var jump_speed = -500
export (int) var gravity = 1500

var velocity = Vector2()
var jumping = false
var collisions

var shells = 0;

signal hit
signal shell

func add_shell():
	emit_signal("shell")
	$ShellSound.play()
	shells += 1

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.Player = self
	screen_size = get_viewport_rect().size

func get_input():
	velocity.x = 0
	var jump = Input.is_action_just_pressed('jump')
	if jump:
		$JumpSound.play()
		jumping = true
		velocity.y = jump_speed

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping:
		jumping = false
	#velocity = move_and_slide(velocity, Vector2(0, 1))
	collisions = move_and_collide(velocity*delta)

	if collisions:
		emit_signal("hit")
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if velocity.length() > 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	if velocity.y > 0:
		$AnimatedSprite.animation = "idle"
	else:
		$AnimatedSprite.animation = "up"
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

