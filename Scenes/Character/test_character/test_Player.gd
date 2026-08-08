extends CharacterBody2D
class_name Character

signal stats_changed
signal equipment_changed

@export var base_stats: CharacterStats
var equipment: Dictionary = {}

var stats: CharacterStats

@export var speed: float = 100.0

@onready var inventory: Inventory = $Inventory
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var marker: Sprite2D = $marker


@export var attack_range: float = 5.0
var target_enemy: Node2D = null

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse_click"):
		target_enemy = null
		set_movement_target(get_global_mouse_position())

func _ready():

	stats = base_stats.duplicate(true)

	initialize_equipment()
	

func _physics_process(delta: float) -> void:
	
	if navigation_agent.is_navigation_finished():
		animation_player.play("idle")
		velocity = Vector2.ZERO
		return
	
	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	var new_velocity: Vector2 = current_agent_position.direction_to(next_path_position) * speed


	velocity = new_velocity
	move_and_slide()

	animation_player.play("walk")

func get_equipped_item(slot: EquipmentSlot.Type) -> Equipment:

	return equipment.get(slot)

func equip_item(item: Equipment):

	if item == null:
		return

	if not inventory.has_item(item):
		return

	var slot = item.slot

	equipment[slot] = item

	recalculate_stats()
	
	equipment_changed.emit()

func unequip_item(slot: EquipmentSlot.Type):
	equipment[slot] = null
	recalculate_stats()
	
	equipment_changed.emit()

func recalculate_stats():
	
	var equipped_items: Array[Equipment] = []
	
	for slot in equipment:
		
		var item: Equipment = equipment[slot]
		
		if item != null:
			equipped_items.append(item)
	
	stats = StatsCalculator.calculate(
		base_stats,
		equipped_items
	)
	
	stats_changed.emit()

func initialize_equipment():

	equipment[EquipmentSlot.Type.HELMET] = null
	equipment[EquipmentSlot.Type.CHEST] = null
	equipment[EquipmentSlot.Type.WEAPON] = null
	equipment[EquipmentSlot.Type.GLOVES] = null
	equipment[EquipmentSlot.Type.BOOTS] = null
	equipment[EquipmentSlot.Type.RING_1] = null
	equipment[EquipmentSlot.Type.RING_2] = null
	equipment[EquipmentSlot.Type.AMULET] = null
	
func set_movement_target(movement_target: Vector2) -> void:
	navigation_agent.target_position = movement_target
