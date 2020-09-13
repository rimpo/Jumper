extends CanvasLayer



func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameGlobals.ms > 9:
		GameGlobals.s += 1
		GameGlobals.ms = 0
	if GameGlobals.s > 59:
		GameGlobals.m += 1
		GameGlobals.s = 0
		GameGlobals.ms = 0
		
	var ms = GameGlobals.ms
	var s = GameGlobals.s
	var m = GameGlobals.m
	$Label2.set_text(str(m).pad_zeros(2) + ":"+ str(s).pad_zeros(2) +":"+str(ms).pad_zeros(2))

	if GameGlobals.fastest_time_available == true:
		$Label4.set_text(str(GameGlobals.fastest_m).pad_zeros(2) + ":"+ str(GameGlobals.fastest_s).pad_zeros(2) +":"+str(GameGlobals.fastest_ms).pad_zeros(2))

func _on_Timer_timeout():
	GameGlobals.ms += 1
