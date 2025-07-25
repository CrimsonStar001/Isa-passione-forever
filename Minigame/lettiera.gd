extends Node2D
# Scacchiera grande 500x250

@export var Punteggio : int = 0
@export var Num_Di_Griglie : int = 8
@export var Grandezza_Griglia: Vector2 = Vector2(500,250)
@onready var Su_Maniglie : Texture2D = preload("res://Sprite/Oggetti/Cursori/Mano.png")
@onready var Paletta : Texture2D = preload("res://Sprite/Oggetti/Cursori/Paletta.png")
@export var difficolta: int 

var Pos_Offset : Vector2
var Cacche: int
func _ready():
	$Split_mini.difficolta = difficolta
	var Pos_Offset : Vector2 = $".".position
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	

func _process(delta):
	if $Maniglie.EnterManiglia == true:
		Input.set_custom_mouse_cursor(Su_Maniglie)
	else:
		Input.set_custom_mouse_cursor(Paletta)


func _input(event):

	if $Maniglie.EnterManiglia == true and event is InputEventMouseButton and event.pressed:
			for i in range(get_child_count() -3):
				get_child(i+3).Animazione()
				
			



func set_my_number(value):
	if value % 2 == 0 or value % 5 == 0:
		return value
	else:
		return value - 1
	
func Make_Grid(Num_Di_Griglie: int, difficolta):
	var Griglie = set_my_number(Num_Di_Griglie)
	var GriglieX = Grandezza_Griglia.x / Griglie
	var CentroGriglieX = GriglieX / 2.0
	for x in range(Griglie):
		for y in range(Griglie/2 ):
			var Numero_Del_Figlio =  (Griglie/2*x) + (y+1)
			var pos_x = CentroGriglieX + (GriglieX * x)
			var pos_y = CentroGriglieX + (GriglieX * y)
			genera_cella(pos_x, pos_y, GriglieX,Numero_Del_Figlio)



var cella_scene = preload("res://Oggetti/Oggetti Minori/Cacche/Cacche.tscn")


func genera_cella(x: int, y: int, Grandezza: int, NumFiglio : int):
	var cella = cella_scene.instantiate()
	cella.Scale = Grandezza
	cella.x = x + Pos_Offset.x
	cella.y = y + Pos_Offset.y
	cella.NumFiglio = NumFiglio
	$".".add_child(cella)
	
var NumeroFiglio : int
	
func Cella_Cliccata(Punti, NumFiglio):
	$Split_mini.show()
	$Split_mini.Attivo = true
	$Split_mini.PHYSICS_INTERPOLATION_MODE_ON
	NumeroFiglio = NumFiglio
	$Split_mini.Punti = Punti

func Prendi_i_punti(Punti):
	Punteggio += Punti
	$Split_mini.hide()
	$Split_mini.Attivo = false
	get_child(NumeroFiglio+2).Scavato()
	
func Numerodicacce(Punti):
	
	Cacche += Punti
