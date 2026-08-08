extends Control

@export var character: Character

@onready var health_label: Label = $PanelContainer/VBoxContainer/HealthLabel
@onready var mana_label: Label = $PanelContainer/VBoxContainer/ManaLabel

@onready var crit_chance_label: Label = $PanelContainer/VBoxContainer/CritChanceLabel
@onready var crit_damage_label: Label = $PanelContainer/VBoxContainer/CritDamageLabel

@onready var attack_speed_label: Label = $PanelContainer/VBoxContainer/AttackSpeedLabel
@onready var cast_speed_label: Label = $PanelContainer/VBoxContainer/CastSpeedLabel

@onready var physical_damage_label: Label = $PanelContainer/VBoxContainer/PhysicalDamageLabel
@onready var fire_damage_label: Label = $PanelContainer/VBoxContainer/FireDamageLabel
@onready var cold_damage_label: Label = $PanelContainer/VBoxContainer/ColdDamageLabel
@onready var lightning_damage_label: Label = $PanelContainer/VBoxContainer/LightningDamageLabel
@onready var poison_damage_label: Label = $PanelContainer/VBoxContainer/PoisonDamageLabel
@onready var holy_damage_label: Label = $PanelContainer/VBoxContainer/HolyDamageLabel
@onready var shadow_damage_label: Label = $PanelContainer/VBoxContainer/ShadowDamageLabel

func _ready():
	character.stats_changed.connect(_on_stats_changed)
	
	update_stats(character.stats)

func _on_stats_changed():

	update_stats(character.stats)

func update_stats(stats: CharacterStats):

	health_label.text = "Vida máxima: " + str(stats.max_health)
	mana_label.text = "Mana máxima: " + str(stats.max_mana)

	crit_chance_label.text = "Chance de crítico: " + str(stats.crit_chance) + "%"
	crit_damage_label.text = "Dano crítico: " + str(stats.crit_damage) + "%"

	attack_speed_label.text = "Velocidade de ataque: " + str(stats.attack_speed)
	cast_speed_label.text = "Velocidade de conjuração: " + str(stats.cast_speed)

	physical_damage_label.text = "Dano físico: " + str(stats.physical_damage)
	fire_damage_label.text = "Dano de fogo: " + str(stats.fire_damage)
	cold_damage_label.text = "Dano de gelo: " + str(stats.cold_damage)
	lightning_damage_label.text = "Dano de raio: " + str(stats.lightning_damage)
	poison_damage_label.text = "Dano de veneno: " + str(stats.poison_damage)
	holy_damage_label.text = "Dano sagrado: " + str(stats.holy_damage)
	shadow_damage_label.text = "Dano sombrio: " + str(stats.shadow_damage)
