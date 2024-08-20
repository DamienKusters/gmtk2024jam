extends Control
class_name Ui

@export var stage_root: StageRoot

@onready var dna_visible = $Grid/Top/ColorRect.visible:
	set(value):
		$Grid/Top/ColorRect.visible = value
		
@onready var timer_visible = $Grid/Top/ColorRect2.visible:
	set(value):
		$Grid/Top/ColorRect2.visible = value

func _ready() -> void:
	Game.dna_updated.connect(func(value): %DnaScore.text = str(value + (Game.stage * 100)))
	Game.timer_updated.connect(func(time): %Time.text = to_time_string(time))
	
static func to_time_string(seconds: float) -> String:
	var minutes = floor(seconds / 60)
	return str(minutes, ":", 0 if seconds < 10 else "", (floori(seconds) % 60))
