extends StageConfiguration
class_name CellStageConfiguration

func _init() -> void:
	entities = [
		preload("res://entities/red_blood_cell/red_blood_cell.tscn"), # PASSIVE
		preload("res://entities/white_blood_cell/white_blood_cell.tscn"), # DANGEROUS
	]
