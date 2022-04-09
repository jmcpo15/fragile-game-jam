extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_bounce(0.1)
	set_friction(0.8)

func launch(force : Vector2) -> void:
	apply_impulse(Vector2.ZERO, force)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
