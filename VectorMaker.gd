extends Area2D

signal vectorCreated(vector)
export var maxLength = 200

var touchDown = false
var groundContact
var startPos = Vector2.ZERO
var endPos = Vector2.ZERO
var vector = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("input_event", self, "_on_input_event")
	groundContact = false

func _draw() -> void:
	draw_line((startPos - global_position), (endPos - global_position), Color.red, 5)
	draw_line((startPos - global_position), (startPos - global_position + vector), Color.blue, 10)
	
func _reset() -> void:
	startPos = Vector2.ZERO
	endPos = Vector2.ZERO
	vector = Vector2.ZERO
	groundContact = false
	update()

func _input(event) -> void:
	if not touchDown:
		return
	
	if event is InputEventMouseMotion:
		endPos = event.position
		vector = -(endPos - startPos).clamped(maxLength)
		update()
		
	if event.is_action_released("ui_touch"):
		touchDown = false
		emit_signal("vectorCreated", vector)
		_reset()

func _on_input_event(_viewport, event, _shape_idx) -> void:
	if event.is_action_pressed("ui_touch"):
		if(groundContact):
			touchDown = true
			startPos = event.position


func resetJump():
	groundContact = true
