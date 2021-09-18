extends KinematicBody2D

var motion = Vector2()
var up = Vector2(0, -2500)
var down = Vector2(0, 2500)
var direction = down

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	motion.y = direction.y

	motion = move_and_slide(motion)

	if position.y > 2000:
		direction = up
		
	if position.y < -2000:
		direction = down
