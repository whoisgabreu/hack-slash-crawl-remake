class_name StatsCalculator
extends RefCounted


static func calculate(
	base_stats: CharacterStats,
	equipment: Array[Equipment]
) -> CharacterStats:

	var final_stats: CharacterStats = base_stats.duplicate(true)

	for item in equipment:

		if item == null:
			continue

		for modifier in item.modifiers:

			apply_modifier(final_stats, modifier)

	return final_stats


static func apply_modifier(
	stats: CharacterStats,
	modifier: StatModifier
) -> void:

	match modifier.stat_type:

		StatType.Type.MAX_HEALTH:
			stats.max_health += modifier.value

		StatType.Type.MAX_MANA:
			stats.max_mana += modifier.value

		StatType.Type.CRIT_CHANCE:
			stats.crit_chance += modifier.value

		StatType.Type.CRIT_DAMAGE:
			stats.crit_damage += modifier.value

		StatType.Type.ATTACK_SPEED:
			stats.attack_speed += modifier.value

		StatType.Type.CAST_SPEED:
			stats.cast_speed += modifier.value

		StatType.Type.PHYSICAL_DAMAGE:
			stats.physical_damage += modifier.value

		StatType.Type.PHYSICAL_DAMAGE_MULT:
			stats.physical_damage_mult += modifier.value

		StatType.Type.POISON_DAMAGE:
			stats.poison_damage += modifier.value

		StatType.Type.POISON_DAMAGE_MULT:
			stats.poison_damage_mult += modifier.value

		StatType.Type.FIRE_DAMAGE:
			stats.fire_damage += modifier.value

		StatType.Type.FIRE_DAMAGE_MULT:
			stats.fire_damage_mult += modifier.value

		StatType.Type.HOLY_DAMAGE:
			stats.holy_damage += modifier.value

		StatType.Type.HOLY_DAMAGE_MULT:
			stats.holy_damage_mult += modifier.value

		StatType.Type.LIGHTNING_DAMAGE:
			stats.lightning_damage += modifier.value

		StatType.Type.LIGHTNING_DAMAGE_MULT:
			stats.lightning_damage_mult += modifier.value

		StatType.Type.COLD_DAMAGE:
			stats.cold_damage += modifier.value

		StatType.Type.COLD_DAMAGE_MULT:
			stats.cold_damage_mult += modifier.value

		StatType.Type.SHADOW_DAMAGE:
			stats.shadow_damage += modifier.value

		StatType.Type.SHADOW_DAMAGE_MULT:
			stats.shadow_damage_mult += modifier.value

		StatType.Type.HEALTH_REGEN:
			stats.health_regen += modifier.value

		StatType.Type.MANA_REGEN:
			stats.mana_regen += modifier.value

		StatType.Type.HEALING_EFFICIENCY:
			stats.healing_efficiency += modifier.value
