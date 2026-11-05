extends CanvasLayer

@export var grid: GridContainer

func _ready():
	Global.inventory_updated.connect(refresh_ui)
	Global.active_slot_index_changed.connect(update_selection_visual)
	refresh_ui()

func refresh_ui():
	for child in grid.get_children(): child.queue_free()
	
	for item in Global.inventory:
		if item != null:
			var slot = Button.new()
			slot.icon = item.icon
			slot.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
			slot.custom_minimum_size = Vector2(32, 32)
			
			if item.amount > 1:
				slot.text = str(item.amount)
				
			grid.add_child(slot)
	
	update_selection_visual()

func update_selection_visual():
	var slots = grid.get_children()
	for i in range(slots.size()):
		if i == Global.active_slot_index:
			slots[i].grab_focus()
		else:
			slots[i].release_focus()
