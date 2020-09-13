extends Area2D

export(String, FILE, "*.tscn") var world_scene

var game_over = preload("res://GameOver.tscn")

var already_processed = false

func _physics_process(delta):
	var bodies = get_overlapping_bodies();
	for body in bodies:
		if body.name == "Player":
			if world_scene == "res://StartMenu.tscn":
				if already_processed == false:
					var time_taken = str(GameGlobals.m).pad_zeros(2) + ":"+ str(GameGlobals.s).pad_zeros(2) +":"+str(GameGlobals.ms).pad_zeros(2)
					print(time_taken)
					var is_record_broken = GameGlobals.game_over()
					var game_over_text = game_over.instance()
					game_over_text.is_record_broken = is_record_broken
					game_over_text.time_taken = time_taken
					add_child(game_over_text)
					already_processed = true
					yield(get_tree().create_timer(1.5), "timeout")
					get_tree().change_scene(world_scene)
			else:
				get_tree().change_scene(world_scene)
