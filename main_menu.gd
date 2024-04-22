extends Control

func _on_play_pressed():
    get_tree().change_scene_to_file("res://level.tscn")

func _on_license_pressed():
    get_tree().change_scene_to_file("res://licenses.tscn")

func _on_quit_pressed():
    get_tree().quit()

