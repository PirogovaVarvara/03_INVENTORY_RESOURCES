extends Node2D

@export var item_id: String = "teleport"
# Called when the node enters the scene tree for the first time.
func _on_area_2d_body_entered_teleport(body: Node2D) -> void: 
	 # Проверка body = Player 
	if body.name == 'Player': 	
		get_tree().change_scene_to_file("res://scenes/ForestTwo.tscn")
		
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
