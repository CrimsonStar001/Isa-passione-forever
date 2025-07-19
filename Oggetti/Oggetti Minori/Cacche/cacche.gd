extends Area2D

@export var x := 0
@export var y := 0
@export var Scale := 1
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		get_parent().Chiamami(x, y)

func _ready():
	print(x, y)
	$CollisionShape2D.scale = Vector2(Scale, Scale)
	$".".x = x
	$".".y = y
