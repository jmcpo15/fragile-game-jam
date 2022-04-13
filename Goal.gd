extends Area2D

signal timerStart
signal timerStop
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timeStart = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func goalEntered(body):
	if body.is_in_group("Player"):
		emit_signal("timerStart")
		timeStart = true


func goalExited(body):
	emit_signal("timerStop")
	timeStart = false


func _on_Timer_timeout():
	get_tree().change_scene("res://level "+str(int(get_tree().current_scene.name)+1))
