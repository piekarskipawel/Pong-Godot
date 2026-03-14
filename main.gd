#extends Node2D
#
#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
extends Node2D

var score_left = 0
var score_right = 0

# Funkcja uruchamiana, gdy coś wleci w lewą strefę
func _on_left_goal_body_entered(body):
	if body.name == "ball": # Sprawdzamy, czy to na pewno piłka
		score_right += 1 # Punkt dla prawego gracza
		$ScoreRight.text = str(score_right) # Aktualizacja napisu
		reset_ball()

# Funkcja uruchamiana, gdy coś wleci w prawą strefę
func _on_right_goal_body_entered(body):
	if body.name == "ball":
		score_left += 1 # Punkt dla lewego gracza
		$ScoreLeft.text = str(score_left)
		reset_ball()

func reset_ball():
	# Ustawiamy piłkę z powrotem na środek ekranu (współrzędne 576, 324 to środek)
	$ball.position = Vector2(576, 324)
	$ball.speed = 400.0 # Przywracamy domyślną prędkość
