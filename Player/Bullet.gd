extends RigidBody2D

var explosion = preload("res://Explosion.tscn")
onready var raycast = $RayCast2D

func _on_Bullet_body_entered(body):
	if !body.is_in_group("player"):
		
		var explosion_instance = explosion.instance()
		explosion_instance.position = get_global_position()
		get_tree().get_root().add_child(explosion_instance)
		
		if body.has_method("kill"):
			body.kill()
			
		queue_free()
		
		
