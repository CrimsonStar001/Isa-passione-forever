extends Node2D

@export var difficolta: int 

@export var Punti: int
@export var Attivo: bool = false
@onready var BackGround = $"Zona che si deve muove/Back_Ground"
@onready var ZonaRossa = $"Zona che si deve muove/Zona Rossa"
@onready var ZonaVerde = $"Zona che si deve muove/Zona Verde"
@onready var Freccetta_Paletta = $"Zona che si deve muove/FreccettaPaletta"
var VolteAttivato: int = 0
func Calcolozonaverde():
	var dimensioni = (BackGround.texture.get_size() * BackGround.scale) - Vector2(7,14)
	var x = dimensioni.x/2
	x -= difficolta*2
	
	return x

func Calcolaposizionezonaverde():
	var Position = (BackGround.texture.get_size() * BackGround.scale)/2 - Vector2(ZonaVerde.size)/2
	return Position

func muovi_freccetta(delta: float, velocita: float, x_inizio: float, x_fine: float):
	var nodo = Freccetta_Paletta
	if not nodo.has_meta("direzione"):
		nodo.set_meta("direzione", 1)  

	var direzione = nodo.get_meta("direzione") as int
	var nuova_x = nodo.position.x + velocita + VolteAttivato * direzione * delta 

	# Inverte direzione ai limiti
	if nuova_x >= x_fine:
		nuova_x = x_fine
		nodo.set_meta("direzione", -1)
	elif nuova_x <= x_inizio:
		nuova_x = x_inizio
		nodo.set_meta("direzione", 1)
	
	if !Attivo:
		nuova_x = 0
	nodo.position.x = nuova_x




func _process(delta):
	if Attivo:
		var dimensioni = (BackGround.texture.get_size() * BackGround.scale) - Vector2(7,14)

		ZonaRossa.size = dimensioni
		ZonaVerde.size.y = dimensioni.y
		ZonaVerde.size.x = Calcolozonaverde()
		ZonaVerde.position = Calcolaposizionezonaverde()
		muovi_freccetta(delta,difficolta*25,ZonaRossa.position.x,dimensioni.x+ZonaRossa.position.x)
		

		posizione(get_global_mouse_position())

func _input(event):
	if Attivo:
		var Posizione_Verde = (BackGround.texture.get_size() * BackGround.scale)/2
		if event is InputEventMouseButton and event.pressed:
			if Freccetta_Paletta.position.x >= Posizione_Verde.x - (Calcolozonaverde()/2) and Freccetta_Paletta.position.x <= Posizione_Verde.x + Calcolozonaverde()/2:
				get_parent().Prendi_i_punti(Punti)
				VolteAttivato += 1

func posizione(x: Vector2):
	x.y -= 40
	x.x += 30
	$"Zona che si deve muove".position = Vector2(x)
