extends Control
@onready var name_input = $MarginContainer/LineEdit

func _on_play_button_pressed():
	
	if name_input.text != "":
		Global.player_name = name_input.text
	else:
		Global.player_name = "Игрок"
	
	
	get_tree().change_scene_to_file("res://scenes/Forest.tscn")
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
