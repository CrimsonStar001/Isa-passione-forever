extends Node2D
# Scacchiera grande 500x250

@export var Punteggio : int = 0
@export var Num_Di_Griglie : int = 8
@export var Grandezza_Griglia: Vector2 = Vector2(500,250)
@onready var Su_Maniglie : Texture2D = preload("res://Sprite/Oggetti/Cursori/Mano.png")
@onready var Paletta : Texture2D = preload("res://Sprite/Oggetti/Cursori/Paletta.png")
@export var difficolta: int = 0
var Pos_Offset : Vector2
func _ready():
	var Pos_Offset : Vector2 = $".".position
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _process(delta):

	if $Maniglie.EnterManiglia == true:
		Input.set_custom_mouse_cursor(Su_Maniglie)
	else:
		Input.set_custom_mouse_cursor(Paletta)


func _input(event):
	
	
	if $Maniglie.EnterManiglia == true and event.is_action_pressed("ui_left") :
		return

func set_my_number(value):
	if value % 2 == 0 or value % 5 == 0:
		return value
	else:
		return value - 1
	
func Make_Grid(Num_Di_Griglie: int, difficolta):
	var Griglie = set_my_number(Num_Di_Griglie)
	var GriglieX = Grandezza_Griglia.x / Griglie
	var CentroGriglieX = GriglieX / 2.0
	var Puntodellacacche: Array[Vector2] = []



	while Puntodellacacche.size() < Griglie-difficolta:
		var x = randi() % Griglie
		print(x)
		var y = randi() % (Griglie / 2)
		print(y)
		var punto = Vector2(x, y)
		if not punto in Puntodellacacche:
			Puntodellacacche.append(punto)


	# Ora genera le celle
	for punto in Puntodellacacche:
		var pos_x = CentroGriglieX + (GriglieX * punto.x)
		var pos_y = CentroGriglieX + (GriglieX * punto.y)
		genera_cella(pos_x, pos_y, GriglieX)



var cella_scene = preload("res://Oggetti/Oggetti Minori/Cacche/Cacche.tscn")


func genera_cella(x: int, y: int, Grandezza: int):
	var numerorandom : int = randi_range(0,1)
	var cella = cella_scene.instantiate()
	cella.Cacca = numerorandom
	cella.Scale = Grandezza
	cella.x = x + Pos_Offset.x
	cella.y = y + Pos_Offset.y
	add_child(cella)

	
func Cella_Cliccata(Punti):
	Punteggio += Punti
	print(Punteggio)
