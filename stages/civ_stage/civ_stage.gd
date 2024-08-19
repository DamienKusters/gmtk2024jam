extends StageConfiguration
class_name CivStage

func _init() -> void:
	minimum_dangerous_entities = .3
	harmless_entities = [
		preload("res://entities/jet/jet.tscn"), # PASSIVE
	]
	dangerous_entities = [
		preload("res://entities/chopper/chopper.tscn"), # DANGEROUS
		preload("res://entities/drone/drone.tscn"), # DANGEROUS
	]
