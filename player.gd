extends CharacterBody2D

class_name Player

@export var speed = 400
@export var gravity = 1600
@export var jumpvelocity = -500
@export var wallPushBack = 300

var IN_WALL_JUMP: bool = false
var pausemenu = preload("res://pause_menu.tscn").instantiate()

func _ready():
	Gamemanger.player  = self

func get_input():
	var input_direction = Input.get_axis("left", "right")
	if !IN_WALL_JUMP:
		velocity.x = input_direction * speed
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jumpvelocity
		elif is_on_wall() && input_direction:
			IN_WALL_JUMP = true
			velocity.x = input_direction * -1 * wallPushBack
			velocity.y = jumpvelocity
			await get_tree().create_timer(0.3).timeout
			IN_WALL_JUMP = false
	if Input.is_action_just_pressed("pause"):
		Gamemanger.player_state = Gamemanger.GAME_STATE.PAUSED
		get_tree().root.add_child(pausemenu)

func _physics_process(delta):
	if Gamemanger.player_state == Gamemanger.GAME_STATE.UNPAUSED:
		if  !is_on_floor():
			if velocity.y > 0:
				velocity.y += (gravity * 1.5) * delta
			velocity.y += gravity * delta
		get_input()
		move_and_slide()

func _on_hurtbox_body_shape_entered(body_rid:RID, body:Node2D, _body_shape_index:int, _local_shape_index:int):
	if body is TileMap:
		var data = body.get_cell_tile_data(0, body.get_coords_for_body_rid(body_rid))
		if data.get_custom_data("damage"):
			Gamemanger.respawn_player()	