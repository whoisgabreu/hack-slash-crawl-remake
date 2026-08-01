extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var a = get_tree().get_first_node_in_group("Player")
	print(a.global_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
