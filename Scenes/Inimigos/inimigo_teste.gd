extends CharacterBody2D

@onready var health_points = 20

func _ready():
	add_to_group("enemies")


func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:	
	if event.is_action_pressed("mouse_click"):
		var player = get_tree().get_first_node_in_group("Player")
		if player:
			print(player.name)
			player.select_target(self)
		

func take_damage(dmg):
	health_points -= dmg
	if health_points <= 0:
		queue_free()
