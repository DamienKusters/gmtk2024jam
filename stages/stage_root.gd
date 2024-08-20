extends Node
class_name StageRoot

var stage_index = -1
var stages = [
	StageModel.new(
		"Cell Stage",
		preload("res://ui/stages/cell_stage.png"),
		preload("res://stages/cell_stage/cell_stage.tscn"),
		preload("res://sound/Microscopic Beginnings.mp3"),
		&"cell"
	),
	StageModel.new(
		"Ocean Stage",
		preload("res://ui/stages/ocean_stage.png"),
		preload("res://stages/ocean_stage/ocean_stage.tscn"),
		preload("res://sound/AquaticAura.mp3"),
		&"ocean"
	),
	StageModel.new(
		"Civilisation Stage",
		preload("res://ui/stages/civ_stage.png"),
		preload("res://stages/civ_stage/civ_stage.tscn"),
		preload("res://sound/Microscopic Beginnings.mp3"),
		&"civ"
	),
	StageModel.new(
		"Solar Stage",
		preload("res://ui/stages/solar_stage.png"),
		preload("res://stages/solar_stage/solar_stage.tscn"),
		preload("res://sound/Consumation Of A Galaxy.mp3"),
		&"solar"
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
		preload("res://sound/Consumation Of A Galaxy.mp3"),
		&"credits"
	),
]

var menu_stage = StageModel.new(
	"<GAME TITLE>",
	preload("res://ui/dna.png"),
	preload("res://stages/menu_stage/menu_stage.tscn"),
	preload("res://sound/Microscopic Beginnings.mp3"),
	&"menu"
)

var requested_stage_index = 0
var loaded_stage

func _ready() -> void:
	Game.to_next_stage.connect(next_stage)
	Game.to_stage.connect(switch_stage)
	Game.screen_blacked_out.connect(load_stage)
	switch_stage(99) # Menu

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		switch_menu_stage()
	
	#var i = 0
	#for key in [
		#Input.is_action_just_pressed("1"),
		#Input.is_action_just_pressed("2"),
		#Input.is_action_just_pressed("3"),
		#Input.is_action_just_pressed("4"),
		#Input.is_action_just_pressed("5"),
	#]:
		#if key:
			#switch_stage(i) # TEST
		#i += 1

func next_stage(): # Helper function
	switch_stage(stage_index + 1)

func switch_menu_stage(): # Helper function
	switch_stage(99)

func switch_stage(index: int):
	if index == 99:
		Game.black_out_screen.emit(menu_stage)
		requested_stage_index = 99
		return
	requested_stage_index = clampi(index, 0, stages.size() - 1) #safety
	Game.black_out_screen.emit(stages[requested_stage_index])

func load_stage():
	if requested_stage_index == stage_index:
		return
	stage_index = requested_stage_index
	if loaded_stage:
		loaded_stage.queue_free()
	var stage = stages[stage_index] if stage_index != 99 else menu_stage
	var new_stage = stage.stage.instantiate() 
	loaded_stage = new_stage
	Game.dna_score = 0
	$AudioStreamPlayer.stream = stage.music
	$AudioStreamPlayer.play(0)
	$CanvasLayer/Ui.dna_visible = stage_index != 99
	$CanvasLayer/Ui.timer_visible = stage_index != 99
	add_child(loaded_stage)
	Game.time_scene(stage.save_key)
