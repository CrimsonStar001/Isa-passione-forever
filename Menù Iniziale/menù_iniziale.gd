extends Node2D

@onready var Sinistro = $GiocoSinistro
@onready var Destro = $GiocoDestro # Sprite a destra
@onready var anim = $AnimationPlayer
@onready var anim2 = $AnimationPlayer2
@onready var G_a = $"Gioco attuale"

@export var images : Array[Mini_Giochi] = []

var current_index = GlobaleAssoluta.Gamecurrent_index
var next_index = 0

func _ready():
	Sinistro.texture = images[current_index].texture
	Sinistro.position = Vector2(320,180)
	if current_index + 1 < images.size():
		Destro.texture = images[current_index + 1]
	else:
		Destro.texture = images[current_index].texture
	Destro.scale.x = 0
	Destro.position = Vector2(540,180)

func _input(event):
	
	if event.is_action_pressed("ui_right"):
		G_a.visible = false
		flip_destro()
	elif event.is_action_pressed("ui_left"):
		G_a.visible = false
		flip_sinistro()

func flip_destro():
	if current_index + 1 < images.size():
		next_index = current_index + 1
		Sinistro.texture = images[next_index].texture
		Destro.texture = images[current_index].texture
		anim2.play("Sinistro Andare")
		anim.play("Destro_Andare")
		current_index = next_index
	if current_index >= 2:
		GlobaleAssoluta.Gamecurrent_index = current_index

func flip_sinistro():
	if current_index -1  >= 0:
		next_index = current_index - 1
		Destro.texture = images[next_index].texture
		Sinistro.texture = images[current_index].texture
		anim2.play("Destro tornare")
		anim.play("Sinstro_Tornare") 
		current_index = next_index
	if current_index <= 0:
		GlobaleAssoluta.Gamecurrent_index = current_index

func _on_animation_player_animation_finished():
		G_a.position = Vector2(320,180)
		G_a.scale.x = 1
		G_a.visible = true 
		G_a.texture = images[current_index]
