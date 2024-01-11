extends Node



func playBack():
	$BackgroundSound.play()

func playBlock():
	$BlockSound.play()
	
func playShotSound():
	$ShotSound.play()
	
func playDead():
	$DeathSound.play()
