extends Area2D
class_name Obstacle


func _on_body_entered(body):
	if body is Player: 
		Global.player_hit.emit()
	pass # Replace with function body.

func _on_area_entered(area):
	if area is Hitbox: 
		Global.enemy_hit.emit()
		queue_free()
	pass # Replace with function body.
