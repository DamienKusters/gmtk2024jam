extends Node2D
class_name Entity

var dna_score = 1

# Flags
var grabbed = false

func eat():
	grabbed = false
	Game.dna_score += dna_score
	queue_free()
