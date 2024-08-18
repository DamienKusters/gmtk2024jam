extends StageConfiguration
class_name CellStage

func _init() -> void:
	harmless_entities = [
		preload("res://entities/red_blood_cell/red_blood_cell.tscn"), # PASSIVE
	]
	dangerous_entities = [
		preload("res://entities/white_blood_cell/white_blood_cell.tscn"), # DANGEROUS
	]
