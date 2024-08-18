extends Node2D

signal entity_eaten

@onready var previous_dna_score = Game.dna_score

func _ready() -> void:
	Game.dna_updated.connect(_dna_updated)

func play_damage_animation():
	$AnimationPlayer.play("damage")

func _dna_updated(dna_score: int):
	if previous_dna_score > dna_score: # You took damage
		play_damage_animation()
	previous_dna_score = dna_score
