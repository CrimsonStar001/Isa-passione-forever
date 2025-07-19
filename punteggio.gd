extends Control

@export var Punteggio : int
func _process(delta):
	var Testo = str(Punteggio).pad_zeros(7)
	$Label.text = Testo
