extends Node2D

func _ready():
	GlobaleAssoluta.Punteggio = 0
	$Orologio.TimerOrologio(20)
	
