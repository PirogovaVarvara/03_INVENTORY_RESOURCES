extends CanvasLayer 

@export var label: Label 
@export var name_label: Label

var item_count: int = 0 

# Как инртерфес появился, он сразу подписывается на обновление сигнала item_collected 
# Что мы создали в global и обновляем грибами 
func _ready() -> void: 
	Global.item_collected.connect(_on_item_collected) 
	name_label.text = Global.player_name
# Функция что вызывается при обновление сигнала item_collected 
# Тут вроде все понятно 
func _on_item_collected(item_name: String) -> void: 
	if item_name == 'mushrooms': 
		item_count += 1 
		label.text = str(item_count)
