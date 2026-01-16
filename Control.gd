extends Control

@onready var highest_label = $PuntosContainer/VBoxContainer/HighestLabel2
@onready var current_label = $PuntosContainer/CurrentLabel

var current_score = 0 :
	set (x) : current_score = x; current_label = str (x)
	
func _on_add_score_pressed():
	current_score += 1
