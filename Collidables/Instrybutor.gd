extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func kill():
	queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("instrybutor")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
