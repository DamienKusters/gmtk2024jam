extends ColorRect

@onready var parent: Ui = $"../.."

func _ready() -> void:
	Game.black_out_screen.connect(_animate_switch_stage)

var _tween: Tween
func _animate_switch_stage(new_stage_data: StageModel):
	$Label.text = new_stage_data.title
	$TextureRect.texture = new_stage_data.icon
	
	_tween = Game.animate(self, _tween)
	_tween.set_ease(Tween.EASE_OUT)
	_tween.tween_property(self, "modulate", Color.WHITE, .7)
	_tween.tween_interval(1)
	_tween.tween_callback(screen_blacked_out)
	_tween.tween_interval(1)
	_tween.tween_property(self, "modulate", Color.TRANSPARENT, .7)

func screen_blacked_out():
	Game.screen_blacked_out.emit()
