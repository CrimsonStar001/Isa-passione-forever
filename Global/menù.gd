extends Control



func _process(delta):
	Funzionalità()
		
	
func Funzionalità():
	if Input.is_action_just_pressed("Pausa"): 
		get_tree().paused = not get_tree().paused
	if $CanvasLayer/Button.button_pressed == true:
		get_tree().paused = false
	if $CanvasLayer/Button2.button_pressed == true:
		get_tree().quit()
	$CanvasLayer.visible = get_tree().paused
	
