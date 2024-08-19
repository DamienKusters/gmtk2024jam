extends Node2D
class_name Kraken

signal entity_eaten
signal damaged

@onready var previous_dna_score = Game.dna_score

func _ready() -> void:
	Game.dna_updated.connect(_dna_updated)

func play_damage_animation():
	$AnimationPlayer.play("damage")
	damaged.emit()

func _dna_updated(dna_score: int):
	if previous_dna_score > dna_score: # You took damage
		play_damage_animation()
	previous_dna_score = dna_score

func get_tentacle():
	return $Tentacle
