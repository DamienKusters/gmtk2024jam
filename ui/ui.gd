extends Control
class_name Ui

@export var stage_root: StageRoot

@onready var dna_visible = $Grid/Top/ColorRect.visible:
	set(value):
		$Grid/Top/ColorRect.visible = value

func _ready() -> void:
	Game.dna_updated.connect(func(value): %DnaScore.text = str(value + (Game.stage * 100)))
