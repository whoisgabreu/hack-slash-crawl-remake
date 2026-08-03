extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var zoom_min:float = 1.0
var zoom_max:float = 9.0


func _input(event: InputEvent) -> void:
	if zoom > Vector2(zoom_max, zoom_max):
		zoom = Vector2(zoom_max, zoom_max)
	elif zoom < Vector2(zoom_min , zoom_min):
		zoom = Vector2(zoom_min , zoom_min)
		
	if event.is_action("zoom_in"):
		zoom += Vector2(0.5, 0.5)
	if event.is_action("zoom_out"):
		zoom -= Vector2(0.5, 0.5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player = get_tree().get_first_node_in_group("Player")
	position = player.position
