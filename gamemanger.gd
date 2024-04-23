extends Node

enum GAME_STATE {PAUSED, UNPAUSED}

var player_state = GAME_STATE.UNPAUSED

var current_checkpoint: CheckPoint
var player: Player


func respawn_player():
    if current_checkpoint != null:
        player.position = current_checkpoint.global_position
    else :
        player.position = Vector2(100, 600)