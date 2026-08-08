extends Control


@export var character: Character


@onready var items_container: VBoxContainer = $PanelContainer/VBoxContainer/ItemsContainer

func _ready():

	character.inventory.inventory_changed.connect(_on_inventory_changed)
	character.equipment_changed.connect(_on_equipment_changed)

	update_inventory()

func _on_inventory_changed():

	update_inventory()

func update_inventory():

	clear_inventory_ui()

	for item in character.inventory.items:

		create_item_button(item)

func clear_inventory_ui():

	for child in items_container.get_children():

		child.queue_free()

func create_item_button(item: Equipment):

	var button := Button.new()

	button.text = item.item_name

	if character.get_equipped_item(item.slot) == item:

		button.text += " [EQUIPADO]"

	button.pressed.connect(
		func():
			_on_item_pressed(item)
	)

	items_container.add_child(button)

func _on_item_pressed(item: Equipment):

	var equipped_item = character.get_equipped_item(item.slot)

	if equipped_item == item:

		character.unequip_item(item.slot)

	else:

		character.equip_item(item)

func _on_equipment_changed():

	update_inventory()
