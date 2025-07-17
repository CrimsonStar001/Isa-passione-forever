extends Control


func _process(delta):
	var Testo = str(GlobaleAssoluta.Punteggio).pad_zeros(7)
	$Label.text = Testo
