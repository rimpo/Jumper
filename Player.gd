extends KinematicBody2D

const UP = Vector2.UP;
var snap_normal = Vector2.DOWN setget set_snap_normal
var motion = Vector2.ZERO;

const GRAVITY = 400;

var MAX_SPEED = 200;
var speed = 200;
var JUMP_HEIGHT = -400;
var ACCELERATION = 50;
var friction = false;

var game_over = preload("res://GameOver.tscn")

var stats = preload("res://GameStats.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var st = stats.instance()
	add_child(st)

func set_snap_normal(new_snap_normal):
	snap_normal = new_snap_normal;

func _physics_process(delta):
	motion.y += delta * GRAVITY;
		
	if Input.is_action_pressed('ui_right'):
		motion.x += ACCELERATION;
		$AnimatedSprite.flip_h = false;
		$AnimatedSprite.play("Run")
	elif Input.is_action_pressed('ui_left'):
		motion.x -= ACCELERATION;
		$AnimatedSprite.flip_h = true;
		$AnimatedSprite.play("Run")
	else:
		$AnimatedSprite.play("Idle")
		friction = true;

	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y > 0:
			$AnimatedSprite.play("Fall")
		else:
			$AnimatedSprite.play("Jump")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
			
	motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED);
	motion = move_and_slide(motion, UP)

	if position.y > 1100:
		var game_over_text = game_over.instance()
		add_child(game_over_text)
		yield(get_tree().create_timer(1.0), "timeout")
		GameGlobals.reset()
		get_tree().change_scene("res://StartMenu.tscn")
	
	
