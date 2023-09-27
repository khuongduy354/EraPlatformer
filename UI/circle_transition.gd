extends ColorRect

var file_path =null
func _change_scene_to(_file_path:String): 
	file_path = _file_path
	$AnimationPlayer.play("trans_in")



func _on_animation_player_animation_finished(anim_name):
	if anim_name == "trans_in": 
		get_tree().change_scene_to_file(file_path)
		$AnimationPlayer.play("trans_out")
