extends Node2D

var seed : int = randi()

# Player Spawn
var player_spawn_location: Vector2
@onready var player_scene = get_tree().get_first_node_in_group("Player")

# Enemy Spawn
var ENEMY := preload("res://Scenes/Inimigos/Inimigo_Teste.tscn")

# Ponteiro do Mouse no Chao

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse_click"):
		print("clicou")
		var marker = get_tree().get_first_node_in_group("marker")
		if marker:
			print("tem marker")
		marker.position = get_global_mouse_position()

# NOISE CONFIG
@export var noise_height_text : NoiseTexture2D
var noise : Noise

var width : int = 100
var height : int = 200

var noise_val_array : Array

# TILES CONFIG
@onready var ground: TileMapLayer = $Layers/ground


var source_id : int = 0

var water_atlas = Vector2i(0,0)
var empty_atlas = Vector2i(0,1)
var grass_atlas = Vector2i(1,0)
var slope_atlas = Vector2i(2,1)
var cliff_atlas = Vector2i(1,1)

func _ready() -> void:
	
	noise = noise_height_text.noise
	noise.set_seed(seed)
	generate_world()
	#player_scene.position = player_spawn_location

#func generate_world():
	#for x in range(width):
		#for y in range(height):
			#var noise_value = noise.get_noise_2d(x, y)
			#noise_val_array.append(noise_value)
			#
			#if noise_value <= -0.1:
				#ground.set_cell(Vector2i(x,y), source_id, water_atlas)
			#
			#if noise_value > -0.1:
				#ground.set_cell(Vector2i(x,y), source_id, grass_atlas)
				#if !player_spawn_location:
					#player_spawn_location = Vector2i(x,y)
					#
			#if noise_value > 0.1:
				#var instance = ENEMY.instantiate()
				#add_child(instance)
				#instance.position = Vector2i(x, y)
				#
			#if noise_value > 0.25:
				#ground.set_cell(Vector2i(x,y), source_id, slope_atlas)
			#if noise_value > 0.30:
				#ground.set_cell(Vector2i(x,y), source_id, cliff_atlas)

func generate_world():
	for x in range(width):
		for y in range(height):
			var noise_value = noise.get_noise_2d(x, y)
			noise_val_array.append(noise_value)
			
			# Definição do Terreno
			if noise_value <= -0.1:
				ground.set_cell(Vector2i(x,y), source_id, water_atlas)
			elif noise_value > -0.1:
				ground.set_cell(Vector2i(x,y), source_id, grass_atlas)
				
				# Define spawn do player apenas uma vez
				if player_spawn_location == Vector2.ZERO: 
					player_spawn_location = Vector2(x, y) # Mantenha como Vector2 para consistência
					
			# Instanciação do Inimigo
			#if noise_value > 0.1:
				#var instance = ENEMY.instantiate()
				#add_child(instance) # 1. Adiciona ao nó atual (mundo), não a si mesmo
				#instance.position = Vector2(x, y) # 2. Converte para Vector2 explícito
				
			# Sobreposição de Tiles (Slope/Cliff)
			if noise_value > 0.35:
				ground.set_cell(Vector2i(x,y), source_id, slope_atlas)
			if noise_value > 0.40:
				ground.set_cell(Vector2i(x,y), source_id, cliff_atlas)

	# Mova o player se a referência for válida
	if player_spawn_location != Vector2.ZERO and player_scene != null:
		player_scene.position = player_spawn_location
	elif player_spawn_location != Vector2.ZERO and player_scene == null:
		push_warning("Player não encontrado no grupo 'Player'. Defina a posição manualmente ou instancie o player.")   
