extends Node

export (PackedScene) var pipeup_scene

var rng = RandomNumberGenerator.new()
var distance = 675


# Called when the node enters the scene tree for the first time.
func _ready():
	$UI/HUD/AnimatedSprite.play()
	rng.randomize()
	$UI/Retry/RetryRect.hide()
	var pipes = get_tree().get_nodes_in_group("pipes")
	for pipe in pipes :
		pipe.connect("score", $UI/HUD/ScoreLabel, "_on_PipeUp_score")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#$Background.position.x -= 10*delta


func _on_Player_hit():
	$UI/Retry/RetryRect.show()


func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UI/Retry/RetryRect.visible:
		get_tree().reload_current_scene()


func _on_Timer_timeout():
	var pipe1 = pipeup_scene.instance()
	var pipe2 = pipeup_scene.instance()
	
	var pipe1y = rng.randf_range(600, 900)
	
	pipe1.global_transform.origin.y = pipe1y
	pipe1.global_transform.origin.x = 600
	
	pipe2.global_transform.origin.y = pipe1y - distance
	pipe2.global_transform.origin.x = 600
	pipe2.rotation_degrees = 180

	
	pipe1.connect("score", $UI/HUD/ScoreLabel, "_on_PipeUp_score")
	
	add_child(pipe1)
	add_child(pipe2)
