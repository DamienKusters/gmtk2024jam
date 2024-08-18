extends Camera2D

func _ready() -> void:
	Game.dna_updated.connect(func(_x): $AnimationPlayer.play("shake"))
