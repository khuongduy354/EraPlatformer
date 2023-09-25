extends Node2D

@export var min_gap = 10
@export var max_gap = 100
@export var PlatformScene:PackedScene = null 

@onready var plats = $Platforms

func _ready(): 
	pass
	
	
# helpers
func gen_gap(): 
	var temp = randi()%max_gap+1
	while temp < min_gap: 
		temp = randi()%max_gap+1
	return temp

func get_last_plat(): 
	var idx = plats.get_child_count()-1
	return plats.get_child(idx)

func spawn_platform(pos): 
	var plat:Platform = PlatformScene.instantiate()
	add_child(plat)
	plat.global_position = pos
	return plat
	
func spawn_next_plat(): 
	var gap = gen_gap()
	var last_plat = get_last_plat()
	
	var new_pos = last_plat.global_position + gap
	spawn_platform(new_pos)
	
	
	
