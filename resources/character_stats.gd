class_name CharacterStats
extends Resource

@export_category("Critical")
@export var crit_chance: float = 5.0
@export var crit_damage: float = 200.0

@export_category("Speed")
@export var attack_speed: float = 1.0
@export var cast_speed: float = 1.0

@export_category("Physical")
@export var physical_damage: float = 0.0
@export var physical_damage_mult: float = 100.0

@export_category("Poison")
@export var poison_damage: float = 0.0
@export var poison_damage_mult: float = 100.0

@export_category("Fire")

@export var fire_damage: float = 0.0
@export var fire_damage_mult: float = 100.0

@export_category("Holy")

@export var holy_damage: float = 0.0
@export var holy_damage_mult: float = 100.0

@export_category("Lightning")

@export var lightning_damage: float = 0.0
@export var lightning_damage_mult: float = 100.0

@export_category("Cold")

@export var cold_damage: float = 0.0
@export var cold_damage_mult: float = 100.0

@export_category("Shadow")

@export var shadow_damage: float = 0.0
@export var shadow_damage_mult: float = 100.0

@export_category("Resources")

@export var health_regen: float = 0.0
@export var mana_regen: float = 0.0

@export var max_health: float = 100.0
@export var max_mana: float = 50.0

@export_category("Healing")

@export var healing_efficiency: float = 100.0
