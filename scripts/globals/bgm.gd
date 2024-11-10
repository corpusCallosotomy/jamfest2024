extends Node

func lockIn():
	$light.volume_db=-80
	$full.volume_db=0

func lockOut():
	$light.volume_db=0
	$full.volume_db=-80
