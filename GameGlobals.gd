extends Node

#fastest time
var fastest_ms = 0
var fastest_s = 0
var fastest_m = 9999
var fastest_time_available = false

var ms = 0
var s = 0
var m = 0

func _ready():
	reset()
	
func reset():
	ms = 0
	s = 0
	m = 0


func game_over() -> bool:
	var is_record_broken = false
	
	var fast_time = false
	if fastest_m > m:
		fast_time = true;
	elif fastest_m == m and fastest_s > s:
		fast_time = true;
	elif fastest_m == m and fastest_s == s and fastest_ms > ms:
		fast_time == true;
	
	if fast_time == true:
		fastest_ms = ms
		fastest_s = s
		fastest_m = m
		fastest_time_available = true
		is_record_broken = true

	ms = 0
	s = 0
	m = 0
	return is_record_broken
