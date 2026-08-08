class_name Character
extends CharacterBody2D


@export var base_stats: CharacterStats

var stats: CharacterStats

@export var speed: float = 100.0

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer
@onready var marker: Sprite2D = $marker


@export var attack_range: float = 5.0
var target_enemy: Node2D = null

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse_click"):
		target_enemy = null
		set_movement_target(get_global_mouse_position())
	
func select_target(enemy: Node2D):
	target_enemy = enemy

func _physics_process(delta: float) -> void:
	
	
	if is_instance_valid(target_enemy):
		
		marker.global_position = target_enemy.position
		marker.visible = true
		
		navigation_agent.target_position = target_enemy.global_position
		
		var distance = global_position.distance_to(target_enemy.global_position)
		
		if distance <= attack_range:
			velocity = Vector2.ZERO
			
			attack()
			return
	else :
		marker.visible = false
	
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
		
func attack():
	print("Atacando o inimigo:", target_enemy.name)
	target_enemy.take_damage(1)

func set_movement_target(movement_target: Vector2) -> void:
	navigation_agent.target_position = movement_target
