extends Node

export (PackedScene) var pipeup_scene

var rng = RandomNumberGenerator.new()



# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	$UI/RetryRect.hide()
	var pipes = get_tree().get_nodes_in_group("pipes")
	for pipe in pipes :
		pipe.connect("score", $UI/ScoreRect/ScoreLabel, "_on_PipeUp_score")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Player_hit():
	$UI/RetryRect.show()


func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UI/RetryRect.visible:
		get_tree().reload_current_scene()


func _on_Timer_timeout():
	print("hello")
	var pipe = pipeup_scene.instance()
	pipe.global_transform.origin.y = rng.randf_range(600, 800)
	pipe.global_transform.origin.x = 700
	pipe.scale.x = 1
	pipe.scale.y = 1
	pipe.connect("score", $UI/ScoreRect/ScoreLabel, "_on_PipeUp_score")
	add_child(pipe)
