extends Label

var score = 0

func _on_PipeUp_score():
	score += 1
	text = "%s" % score


func _on_Shell_shell():
	score += 1
	text = "%s" % score
