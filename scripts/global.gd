extends Node

# Сигнал передачи имя предмета
signal item_collected(item_name: String)
var player_name: String = "Игрок"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Сигнал уведомления об обновлении инвентаря (удаляем старый сигнал)
signal inventory_updated
signal active_slot_index_changed
var inventory: Array[ItemData] = []
var active_slot_index: int = 0
var max_inventory_size: int = 10

func add_item(item: ItemData):
	if item == null: return

	# Проверяем, есть ли уже такой предмет в инвентаре (по ссылке на ресурс)
	if inventory.has(item):
		var index = inventory.find(item)
		inventory[index].amount += item.amount
	else:
		inventory.append(item)
		
	inventory_updated.emit()
