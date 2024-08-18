extends Node

signal dna_updated

const DNA_SCORE_HEIGHT_VALUE = 50

var dna_score = 0:
	set(value):
		dna_score = clampi(value, 0, 100)
		dna_updated.emit(dna_score)

func animate(_parent: Node, _tween: Tween):
	if _tween:
		_tween.kill() # Abort the previous animation.
	return _parent.create_tween()
