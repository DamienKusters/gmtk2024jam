extends StageConfiguration
class_name CivStage

func _init() -> void:
	harmless_entities = [
		preload("res://entities/jet/jet.tscn"), # PASSIVE
	]
	dangerous_entities = [
		preload("res://entities/chopper/chopper.tscn"), # DANGEROUS
	]
