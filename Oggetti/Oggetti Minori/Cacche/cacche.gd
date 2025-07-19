extends Area2D

@export var x = 0
@export var y = 0
@export var Scale : float = 64
@export var Tipologia : Array[Cacche_Class] = []
@export_range(0, 1) var Cacca : int = 1
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		get_parent().Cella_Cliccata(Tipologia[Cacca].punti)
		$".".hide()

func _ready():
	$Sprite2D.texture = Tipologia[Cacca].texture
	$Sprite2D.scale = Vector2(Scale/64, Scale/64)
	$CollisionShape2D.scale = Vector2(Scale, Scale)
	$".".position.x = x
	$".".position.y = y
