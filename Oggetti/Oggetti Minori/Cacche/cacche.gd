extends Area2D

@export var x = 0
@export var y = 0
@export var Scale : float = 64
@export var NumFiglio : int
@export var Tipologia : Array[Cacche_Class] = []
@export_range(0, 2) var Cacca : int = 0
@onready var anim = $AnimationPlayer
var Provato = false

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and !Provato:
		get_parent().Cella_Cliccata(Tipologia[Cacca].punti, NumFiglio)
		Provato = true
			


func Scavato():
	if Cacca >= 1:
		$Sprite2D.texture = Tipologia[Cacca].texture
	else:
		$".".hide()
	
	
		
func _ready():
	print(get_index())
	trova_casuale()
	$Sprite2D.texture = Tipologia[0].texture
	$Sprite2D.scale = Vector2(Scale/64, Scale/64)
	$CollisionShape2D.scale = Vector2(Scale, Scale)
	$".".position.x = x
	$".".position.y = y

func trova_casuale():
	for i in range(Tipologia.size()):
		var numerorandom : int = randi_range(1,Tipologia[(Tipologia.size()-1)-i].Probabilità)

		if numerorandom == Tipologia[(Tipologia.size()-1)-i].Probabilità:
			Cacca = Tipologia.size()-1-i
			break
	return

func Prova():
	print("Prova")
	
	
func Animazione():
	if Cacca == 0:
		anim.play("Scuoti_leggero")
	else:
		anim.play("Scuoti_leggero")
