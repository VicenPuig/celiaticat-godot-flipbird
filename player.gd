extends RigidBody2D

var speed := 400
var score := 0
var scoreMax := 0



func _integrate_forces(_state):
	if Input.is_action_just_pressed("ui_accept"):
		$"../FlapAudioStreamPlayer".play()
		linear_velocity = Vector2.ZERO
		apply_central_impulse(Vector2(0,-speed))
		$AnimatedSprite2D.play("flap")

func morir():
	$"../HitAudioStreamPlayer".play()
	get_tree().paused = true
	$"../Message".show()
	$"../Message/Gameover".show()
	
func subirScore():
	$"../PointAudioStreamPlayer".play()
	score+=1
	$"../ScoreLabel".text = str(score)
	
"""func subirScoreMax():
	if score >= score:
		scoreMax == score
		$"../ScoreLabel2".text = str(scoreMax)
	else:
		scoreMax == null"""
	
func _on_detecta_suelo_body_entered(body):
	if body.is_in_group("Obstaculo"):
		morir()
