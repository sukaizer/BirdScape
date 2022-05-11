extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$UI/RetryRect.hide()
	var pipes = get_tree().get_nodes_in_group("pipes")
	for pipe in pipes :
		pipe.connect("score", $UI/ScoreLabel, "_on_PipeUp_score")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Player_hit():
	$UI/RetryRect.show()


func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UI/RetryRect.visible:
		get_tree().reload_current_scene()
