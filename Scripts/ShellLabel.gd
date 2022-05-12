extends Label

var shells = 0


func _on_Player_shell():
	shells += 1
	text = "%s" % shells
