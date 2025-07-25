extends Node2D

func _ready():
	$Punteggio.Punteggio = 0
	$Orologio.TimerOrologio(60)
	$Lettiera.Make_Grid(8,4)
	
func _process(delta):
	$Punteggio.Punteggio = $Lettiera.Punteggio
