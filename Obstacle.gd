extends StaticBody2D
signal bodyEntered
signal timerStart
signal timerStop
signal resetJump

var timerOn = false


func id():
	return 0

func _on_Area2D_body_entered(body):
	if body.id() == 2:
		emit_signal("bodyEntered")
		emit_signal("timerStart")
		timerOn = true



func _on_Area2D_body_exited(body):
	if timerOn :
		emit_signal("timerStop")


func timerTimeout():
	emit_signal("resetJump")
