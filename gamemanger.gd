extends Node

var current_checkpoint
var player

func respawn_player():
    if current_checkpoint != null:
        player.position = current_checkpoint.global_position
    else :
        player.position = Vector2(100, 600)