extends Node3D

var velocity: Vector3 = Vector3(0,0,0)
var input_dir: Vector2
var speed: float = 100.0
var max_speed: float = 1000.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	apply_force(velocity*-0.1)
	input_dir = Input.get_vector("Left", "Right", "Back", "Forward")
	apply_force(Vector3(speed*input_dir.x,speed*input_dir.y,0) )
	print(velocity.x, " ", velocity.y, " ", velocity.z, "/nww")
	
func apply_force(F: Vector3) -> void:
	if( velocity.x + F.x > max_speed || velocity.x + F.x < -1*max_speed ):
		if ( velocity.x < 0 ):
			velocity.x = -1*max_speed
		else:
			velocity.x = max_speed
	else:
		velocity.x = velocity.x + F.x
	
	if( velocity.y + F.y > max_speed || velocity.y + F.y < -1*max_speed ):
		if ( velocity.y < 0 ):
			velocity.y = -1*max_speed
		else:
			velocity.y = max_speed
	else:
		velocity.y = velocity.y + F.y
