extends Node2D
class_name Projectile

var dna_damage = 1

func tentacle_hit(_area: Area2D) -> void:
	Game.dna_score -= dna_damage
	queue_free()
