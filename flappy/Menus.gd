extends CanvasLayer

onready var tap = $StartMenu/Tap
onready var tween = $Tween
onready var cur_score = $GameOverMenu/CurScore
onready var best_score = $GameOverMenu/BestScore
onready var game_over_menu = $GameOverMenu

signal start_game
var started = false

func _input(event):
	if event.is_action_pressed("flap") and !started:
		emit_signal("start_game")
		tween.interpolate_property(tap, "modulate:a", 1, 0, 0.5)
		tween.start()
		started = true

func init_game_over_menu(score):
	print("game_over")
	cur_score.text = "SCORE " + str(score)
	game_over_menu.visible = true

func _on_Restart_pressed():
	get_tree().reload_current_scene()
