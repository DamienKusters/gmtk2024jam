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
signal timer_updated

var scene_to_be_timed: String

var dna_score = 0:
	set(value):
		dna_score = clampi(value, 0, 100)
		if dna_score >= 100:
			save_time_scene(scene_to_be_timed)
			to_next_stage.emit()
		dna_updated.emit(dna_score)

var time: float = 0
func time_scene(key: String):
	scene_to_be_timed = key
	time = 0
	$GameTimer.start()

func save_time_scene(key: String):
	$GameTimer.stop()
	if scene_to_be_timed:
		var previous_score = Save.get_stage_score(scene_to_be_timed)
		if previous_score == -1 or previous_score > time:
			Save.set_stage_score(scene_to_be_timed, time)
			Save.save_file()
	scene_to_be_timed = ""
	time = 0

func animate(_parent: Node, _tween: Tween):
	if _tween:
		_tween.kill() # Abort the previous animation.
	return _parent.create_tween()

func _on_game_timer_timeout() -> void:
	time += $GameTimer.wait_time
	timer_updated.emit(time)
