extends Node

signal dna_updated

var stage = 0

const DNA_SCORE_HEIGHT_VALUE = 50

# Stage stuff
signal to_next_stage
signal to_stage
# UI stuff
signal black_out_screen
signal screen_blacked_out

signal sound

var dna_score = 0:
	set(value):
		dna_score = clampi(value, 0, 100)
		if dna_score >= 100:
			to_next_stage.emit()
		dna_updated.emit(dna_score)

func animate(_parent: Node, _tween: Tween):
	if _tween:
		_tween.kill() # Abort the previous animation.
	return _parent.create_tween()
