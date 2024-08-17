extends Camera2D

@onready var kraken = $"../Kraken"

func _ready() -> void:
	kraken.entity_eaten.connect(func(): $AnimationPlayer.play("shake"))
