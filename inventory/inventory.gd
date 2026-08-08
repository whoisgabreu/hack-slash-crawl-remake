class_name Inventory
extends Node

signal inventory_changed

@export var items: Array[Equipment] = []
var item_instances: Array[ItemInstance] = []

func add_item(item: Equipment):

	if item == null:
		return

	items.append(item)

	inventory_changed.emit()

func remove_item(item: Equipment):

	if item == null:
		return

	items.erase(item)
	
	inventory_changed.emit()

func has_item(item: Equipment) -> bool:

	return item in items
