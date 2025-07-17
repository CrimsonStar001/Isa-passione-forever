extends Area2D
var hovered := false



	

func _on_mouse_exited():
	hovered = false
	print("Mouse via!")


func _on_mouse_entered() -> void:
	hovered = true
	print("Mouse sopra!")
