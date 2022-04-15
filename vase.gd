extends RigidBody2D

signal resetJump
signal damageSprite
signal destroy

var damage
var damageTime
var damageFreeze = false
var linearVelocity

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Player")
	damage = 0
	damageTime = 0
	set_bounce(0.1)
	set_friction(0.8)
	
func launch(force : Vector2) -> void:
	$throwSound1.play()
	apply_impulse(Vector2.ZERO, force)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	linearVelocity = get_linear_velocity().length()

func hardObstacleCollision():
	if (((damageTime + 1000 < OS.get_ticks_msec() and get_linear_velocity().length() > 100) or (damageTime + 2000 < OS.get_ticks_msec() and get_linear_velocity().length() > 25)) and not damageFreeze):
		damage += 1
		damageTime = OS.get_ticks_msec()
		print(get_linear_velocity().length())
		if damage > 2:
			set_sleeping(true)
			emit_signal("destroy")
			$smash1.play()
			damageFreeze = true
		else:
			emit_signal("damageSprite")
			$crack1.play()


func _on_Hard_Obstacle_bodyEntered():
	hardObstacleCollision()


func resetJump():
	emit_signal("resetJump")



func smashFinish():
	get_tree().reload_current_scene()


func _on_AnimationPlayer_animation_finished(anim_name):
	hide()
