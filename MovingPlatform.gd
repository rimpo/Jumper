extends KinematicBody2D

export var move_speed = 2.0;
export var move_distance = 50.0;
export var move_direction = Vector2(1, 1);

var time_since_init = 0.0;
var origin = Vector2.ZERO;
var pos_on_curve = 0.0;

func _ready():
	time_since_init = 0.0;
	origin = position;

func _physics_process(delta):
	time_since_init += delta
	# value between -1 and 1
	pos_on_curve = sin(move_speed * PI * time_since_init);
	var offset = move_direction * pos_on_curve * move_distance;
	if move_direction.x > 0:
		position.x = origin.x + offset.x;
	if move_direction.y > 0:
		position.y = origin.y + offset.y;
