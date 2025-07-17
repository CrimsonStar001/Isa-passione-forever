extends Control
var elapsed_time = 0.0
var rotating := false
var rotation_time
func _ready():
	$Lancetta.rotation = 0.0
	
func TimerOrologio(tempo):
	if rotating == false:
		$Timer.wait_time = tempo
		$Timer.start()
		rotation_time = tempo
		rotating = true
	

	
func _process(delta: float):
	if rotating:
		elapsed_time += delta
		var t = elapsed_time / rotation_time

		if t < 1.0:
			$Lancetta.rotation = lerp(0.0, TAU, t)  # TAU = 2*PI, cioè 360°
		else:
			$Lancetta.rotation = 0.0
			rotating = false


func _on_timer_timeout() -> void:
	rotation = false
