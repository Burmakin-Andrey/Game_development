extends Node2D

onready var hud = $HUD
onready var obstacle = $Spawner
onready var player = $Player
onready var background = $BackGround
onready var menu_layer = $Menus
onready var menu_music = $AudioStreamPlayer


var score = 0 setget set_score

func _ready():
	menu_music.play()
	obstacle.connect("obstacle_created", self, "created")

func new_game():
	self.score = 0
	obstacle.start()

func player_score():
	self.score += 1
	print("score++")

func set_score(new_score):
	score = new_score
	hud.update_score(score)
	
func created(obs):
	obs.connect("score",  self, "player_score")
 
func _on_DeathZone_body_entered(body):
	if body == Player:
		player.die()

func _on_Player_died():
	game_over()
	
func _on_Menus_start_game():
	new_game()
	
func game_over():
	obstacle.stop()
	background.get_node("AnimationPlayer").stop()
	background.get_node("AnimationPlayer2").stop()
	background.get_node("AnimationPlayer3").stop()
	background.get_node("AnimationPlayer4").stop()
	background.get_node("AnimationPlayer5").stop()
	get_tree().call_group("obstacles", "set_physics_process", false)
	menu_layer.init_game_over_menu(score)

