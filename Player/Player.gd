extends KinematicBody2D

#export var speed = 100
#export var bullet_speed = 1000
#export var fire_rate = 0.2
export var speed = 100
export var bullet_speed = 500
export var fire_rate = 0.5

var bullet = preload("res://Player/Bullet.tscn")
var can_fire = true

func _ready():
	yield(get_tree(), "idle_frame")
	get_tree().call_group("plants", "set_player", self)

func _process(delta):
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("fire") and can_fire:
		var bullet_instance = bullet.instance()
		bullet_instance.position = $BulletPoint.get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(fire_rate), "timeout")
		can_fire = true
		
	if get_tree().get_nodes_in_group("instrybutor").size() == 0:
		print("Strzeliles w instrybutor. GAME OVER!")
		get_tree().quit()
	
	if get_tree().get_nodes_in_group("plants").size() == 0:
		print("WIN!")
		get_tree().quit()
	
func kill():
	get_tree().reload_current_scene()
