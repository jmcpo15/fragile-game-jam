extends RigidBody2D

signal resetJump

var damage

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Player")
	damage = 0
	set_bounce(0.1)
	set_friction(0.8)
	
func launch(force : Vector2) -> void:
	$throwSound1.play()
	apply_impulse(Vector2.ZERO, force)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func hardObstacleCollision():
	damage += 1
	print(damage)
	if damage > 3:
		get_tree().reload_current_scene()


func _on_Hard_Obstacle_bodyEntered():
	hardObstacleCollision()


func resetJump():
	emit_signal("resetJump")
