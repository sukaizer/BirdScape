extends Node

export (PackedScene) var pipe_scene

var rng = RandomNumberGenerator.new()
var distance = 675
var paused = false


# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.isPlaying = true
	$UI/HUD/AnimatedSprite.play()
	rng.randomize()
	$UI/Retry/RetryRect.hide()
	$UI/Pause/PauseRect.hide()
	var pipes = get_tree().get_nodes_in_group("pipes")
	for pipe in pipes :
		pipe.connect("score", $UI/HUD/ScoreLabel, "_on_PipeUp_score")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#$Background.position.x -= 10*delta


func _on_Player_hit():
	$UI/Retry/RetryRect.show()
	GameManager.isPlaying = false


func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UI/Retry/RetryRect.visible:
		get_tree().reload_current_scene()
	if event.is_action_pressed("pause") and not paused:
		GameManager.isPlaying = false
		paused = true
		$UI/Pause/PauseRect.show()
		print("hello")
	elif event.is_action_pressed("pause") and paused:
		GameManager.isPlaying = true
		$UI/Pause/PauseRect.hide()
		paused = false



func _on_Timer_timeout():
	if  GameManager.isPlaying:
		var pipe1 = pipe_scene.instance()
		var pipe2 = pipe_scene.instance()
		
		var pipe1y = rng.randf_range(600, 900)
		
		add_child(pipe1)
		add_child(pipe2)
		
		pipe1.global_transform.origin.y = pipe1y
		pipe1.global_transform.origin.x = 600
		
		pipe2.global_transform.origin.y = pipe1y - distance
		pipe2.global_transform.origin.x = 600
		pipe2.rotation_degrees = 180

		
		pipe1.connect("score", $UI/HUD/ScoreLabel, "_on_PipeUp_score")
	

