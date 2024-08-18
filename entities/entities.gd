extends Node2D

const GROWTH_SPEED = 3
var growth_position = Vector2.ZERO

func _ready():
	Game.dna_updated.connect(animate_growth_position)

var _position_tween: Tween
func animate_growth_position(dna_score: int):
	growth_position = Vector2(0, Game.DNA_SCORE_HEIGHT_VALUE * dna_score)
	var _tween = Game.animate(self, _position_tween)
	_tween.tween_property(self, "position", growth_position, GROWTH_SPEED)
	_tween.set_ease(Tween.EASE_OUT)
