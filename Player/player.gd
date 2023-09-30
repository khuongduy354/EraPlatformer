extends CharacterBody2D
class_name Player

@export var move_speed =5000 
@export var jump_force =500
@onready var anim_p = $AnimationPlayer
enum {MOVE, ATTACK}
var state = MOVE

func _physics_process(delta):
	apply_gravity(delta)
	match state: 
		MOVE: _move(delta)
		ATTACK: _attack(delta)

func _attack(delta): 
	anim_p.play("attack")
	pass 
	
func _move(delta): 

	velocity.x = move_speed *delta 
	if Input.is_action_just_pressed("jump") and is_on_floor(): 
		anim_p.play("jump")
		velocity.y = -jump_force
	elif is_on_floor() and Input.is_action_just_pressed("attack"): 
		state = ATTACK
	elif is_on_floor(): 
		anim_p.play("walk")
	move_and_slide()
	
func apply_gravity(delta): 
	velocity.y += Global.GRAVITY*delta


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "attack": 
		state = MOVE
	pass # Replace with function body.
