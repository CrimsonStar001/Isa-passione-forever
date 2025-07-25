extends Area2D
var hovered := false
var EnterManiglia := false  


	

func _on_mouse_exited():
	hovered = false
	EnterManiglia = false


func _on_mouse_entered():
	hovered = true
	EnterManiglia = true
	
	print("Mouse sopra!")

	
