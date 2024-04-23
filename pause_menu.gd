extends Control

func _on_resume_pressed():
    Gamemanger.player_state = Gamemanger.GAME_STATE.UNPAUSED
    get_tree().root.remove_child(self)

func _on_quit_pressed():
    get_tree().quit()
