extends Node2D

@onready var Sinistro = $"../GiocoSinistro"
@onready var Destro = $"."  # Sprite a destra
@onready var anim = $"../AnimationPlayer"
@onready var anim2 = $"../AnimationPlayer2"
var images = [
	preload("res://Sprite/Gioco 1.png"),
	preload("res://Sprite/Gioco 2.png"),
	preload("res://Sprite/Gioco 3.png")
]

var current_index = GlobaleAssoluta.Gamecurrent_index
var next_index = 0

func _ready():
	Sinistro.texture = images[current_index]
	Sinistro.position = Vector2(320,180)
	if current_index + 1 < images.size():
		Destro.texture = images[current_index + 1]
	else:
		Destro.texture = images[current_index]
	Destro.scale.x = 0
	Destro.position = Vector2(540,180)

func _input(event):
	
	if event.is_action_pressed("ui_right"):
		$"../Gioco attuale".visible = false
		flip_destro()
	elif event.is_action_pressed("ui_left"):
		$"../Gioco attuale".visible = false
		flip_sinistro()

func flip_destro():
	if current_index + 1 < images.size():
		next_index = current_index + 1
		Sinistro.texture = images[next_index]
		Destro.texture = images[current_index]
		anim2.play("Sinistro Andare")
		anim.play("Destro_Andare")
		current_index = next_index
	if current_index >= 2:
		GlobaleAssoluta.Gamecurrent_index = current_index

func flip_sinistro():
	if current_index -1  >= 0:
		next_index = current_index - 1
		Destro.texture = images[next_index]
		Sinistro.texture = images[current_index]
		anim2.play("Destro tornare")
		anim.play("Sinstro_Tornare") 
		current_index = next_index
	if current_index <= 0:
		GlobaleAssoluta.Gamecurrent_index = current_index

func _on_animation_player_animation_finished(anim_name):
		$"../Gioco attuale".position = Vector2(320,180)
		$"../Gioco attuale".scale.x = 1
		$"../Gioco attuale".visible = true 
		$"../Gioco attuale".texture = images[current_index]
