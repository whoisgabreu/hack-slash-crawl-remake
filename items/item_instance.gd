class_name ItemInstance
extends RefCounted

#var item_data: ItemData
#var modifiers: Array[StatModifier] = []
#
#func _init(data: ItemData) -> void:
	#item_data = data
#
#func get_item_name() -> String:
#
	#return item_data.item_name
	#
	#
#func get_slot() -> EquipmentSlot.Type:
#
	#return item_data.slot


var equipment: Equipment
var modifiers: Array[StatModifier] = []

func _init(data: Equipment) -> void:
	equipment = data

func get_item_name() -> String:

	return equipment.item_name
	
	
func get_slot() -> EquipmentSlot.Type:

	return equipment.slot

func add_modifier(modifier: StatModifier):
	
	if modifier == null:
		return

	modifiers.append(modifier)
	
func get_all_modifiers() -> Array[StatModifier]:

	var all_modifiers: Array[StatModifier] = []

	for modifier in equipment.modifiers:

		all_modifiers.append(modifier)

	for modifier in modifiers:

		all_modifiers.append(modifier)

	return all_modifiers
	
