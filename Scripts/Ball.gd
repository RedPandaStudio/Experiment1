extends RigidBody2D

export var SPEEDUP = 4
const MAXSPEED = 800

var number_bricks = 0

func _ready():
	set_fixed_process(true);
	
func _fixed_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("Bricks"):
			get_node("/root/World").score += 5
			get_node("Horn").play("horn")
			body.queue_free()
			number_bricks += 1
		
		if body.get_name() == "Paddle":
			var speed = get_linear_velocity().length()
			var direction = get_pos() - body.get_node("Anchor").get_global_pos()
			var velocity = direction.normalized()*min(speed + SPEEDUP, MAXSPEED)
			set_linear_velocity(velocity)
			
		if(number_bricks == 16):
			get_tree().change_scene("res://Worlds/win_menu.tscn")
			
	if get_pos().y > get_viewport_rect().end.y:
		get_tree().change_scene("res://Worlds/death_menu.tscn")
		queue_free()
