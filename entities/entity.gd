extends Node2D
class_name Entity

var projectile = null # Not used by non-dangerous entities

var dna_score = 1
var weight = 1
var projectile_dna_damage = 1
var particle_color_eat = Color.RED
#TODO: particle_color_grab
#TODO: sound_effect_eat
#TODO: sound_effect_grab

func eat():
	Game.dna_score += dna_score
	queue_free()

func instantiate_projectile() -> Projectile:
	var i = projectile.instantiate()
	i.position = position
	return i
