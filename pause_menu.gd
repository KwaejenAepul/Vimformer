extends Control

func _on_resume_pressed():
    Gamemanger.player_state = Gamemanger.GAME_STATE.UNPAUSED

func _on_quit_pressed():
    get_tree().quit()
