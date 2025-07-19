extends Node2D
# Scacchiera grande 500x250


@export var Num_Di_Griglie : int = 8
@export var Grandezza_Griglia: Vector2 = Vector2(500,250)
@onready var Su_Maniglie : Texture2D = preload("res://Sprite/Gioco 1.png")
@onready var Paletta : Texture2D = preload("res://Sprite/Oggetti/Cursori/Paletta.png")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	Make_Grid(Num_Di_Griglie) 

func _process(delta):
	var Pos_Offset : Vector2 = $Lettiera_Background.position
	if $Maniglie.EnterManiglia == true:
		Input.set_custom_mouse_cursor(Su_Maniglie)
	else:
		Input.set_custom_mouse_cursor(Paletta)
	Make_Grid(Num_Di_Griglie)

func _input(event):
	
	
	if $Maniglie.EnterManiglia == true and event.is_action_pressed("ui_left") :
		return

func set_my_number(value):
	if value % 2 == 0 or value % 5 == 0:
		return value
	else:
		return value - 1
	
func Make_Grid(Num_Di_Griglie):
	var Griglie = set_my_number(Num_Di_Griglie)
	var GriglieX = Grandezza_Griglia.x/Griglie
	var CentroGriglieX = GriglieX/2

	for x in range(Griglie):
		for y in range(Griglie/2):
			genera_cella(CentroGriglieX * x,CentroGriglieX * y,GriglieX)


var cella_scene = preload("res://Oggetti/Oggetti Minori/Cacche/Cacche.tscn")

func key(x: int, y: int) -> String:
	return "%d:%d" % [x, y]
var griglia = {} 	
func genera_cella(x: int, y: int, Grandezza: int):
	var k = key(x, y)
	if griglia.has(k):
		return  # già esiste

	var cella = cella_scene.instantiate()
	cella.position = Vector2(x, y) * x
	cella.Scale = Grandezza
	cella.x = x
	cella.y = y
	add_child(cella)
	griglia[k] = cella
	
func Chiamami(x, y):
	print(x,y)
