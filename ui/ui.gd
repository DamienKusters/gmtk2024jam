extends Control

func _ready() -> void:
	Game.dna_updated.connect(func(value): %DnaScore.text = str(value + (Game.stage * 100)))
