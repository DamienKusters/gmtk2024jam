extends StageConfiguration
class_name GrassStage

func _init() -> void:
	harmless_entities = [
		preload("res://entities/red_blood_cell/red_blood_cell.tscn"), # PASSIVE
	]
	dangerous_entities = [
		preload("res://entities/bird/bird.tscn"), # DANGEROUS
	]
