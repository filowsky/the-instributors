extends StaticBody2D

func _ready():
	add_to_group("plants")

func kill():
	queue_free()
