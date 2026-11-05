extends Node


@export var hand: Sprite2D
@export var item_resources: ItemData # Сюда закиньте топор, это будет 1 предмет

func _ready() -> void:
	Global.add_item(item_resources)

func _unhandled_input(event):
	if event.is_action_pressed('use_tool'):
		# Проверяем, есть ли вообще предметы в инвентаре
		if Global.inventory.size() > 0:
			var item = Global.inventory[Global.active_slot_index] # берем текущий предмет
			
			# Логика переключения (Toggle)
			if hand.texture == item.icon:
				# Если предмет уже в руке - убираем его
				hand.texture = null
				equipped_tool = null
			else:
				# Если рука пуста или там другой предмет - берем текущий
				hand.texture = item.icon
				# Если это инструмент, записываем его в equipped_tool
				equipped_tool = item if item.is_tool else null 
var equipped_tool: ItemData
