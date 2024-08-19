extends Node
class_name StageRoot

var stage_index = -1
var stages = [
	StageModel.new(
		"Cell Stage",
		preload("res://ui/stages/cell_stage.png"),
		preload("res://stages/cell_stage/cell_stage.tscn"),
		preload("res://sound/Microscopic Beginnings.mp3"),
	),
	StageModel.new(
		"Ocean Stage",
		preload("res://ui/stages/ocean_stage.png"),
		preload("res://stages/ocean_stage/ocean_stage.tscn"),
		preload("res://sound/AquaticAura.mp3"),
	),
	StageModel.new(
		"Civilisation Stage",
		preload("res://ui/stages/civ_stage.png"),
		preload("res://stages/civ_stage/civ_stage.tscn"),
		preload("res://sound/Microscopic Beginnings.mp3"),
	),
	StageModel.new(
		"Solar Stage",
		preload("res://ui/stages/solar_stage.png"),
		preload("res://stages/solar_stage/solar_stage.tscn"),
		preload("res://sound/Microscopic Beginnings.mp3"),
	),
	#StageModel.new(
		#"Cosmic Stage",
		#preload("res://ui/stages/cosmic_stage.png"),
		#preload("res://stages/cell_stage/cell_stage.tscn"), #TODO: replace
		#preload("res://sound/Microscopic Beginnings.mp3"),
	#),
	StageModel.new(
		"Credits Stage",
		preload("res://ui/stages/credits_stage.png"),
		preload("res://stages/credits_stage/credits_stage.tscn"), #TODO: replace
		preload("res://sound/Microscopic Beginnings.mp3"),
	),
]

var requested_stage_index = 0
var loaded_stage

func _ready() -> void:
	Game.to_next_stage.connect(next_stage)
	Game.screen_blacked_out.connect(load_stage)
	switch_stage(0) # TEST: load cell stage

func _process(_delta: float) -> void:
	var i = 0
	for key in [
		Input.is_action_pressed("1"),
		Input.is_action_pressed("2"),
		Input.is_action_pressed("3"),
		Input.is_action_pressed("4"),
		Input.is_action_pressed("5"),
	]:
		if key:
			switch_stage(i) # TEST
		i += 1

func next_stage(): # Helper function
	switch_stage(stage_index + 1)

func switch_stage(index: int):
	requested_stage_index = clampi(index, 0, stages.size() - 1) #safety
	Game.black_out_screen.emit(stages[requested_stage_index])

func load_stage():
	if requested_stage_index == stage_index:
		return
	stage_index = requested_stage_index
	if loaded_stage:
		loaded_stage.queue_free()
	var new_stage = stages[stage_index].stage.instantiate()
	loaded_stage = new_stage
	Game.dna_score = 0
	$AudioStreamPlayer.stream = stages[stage_index].music
	$AudioStreamPlayer.play(0)
	add_child(loaded_stage)
