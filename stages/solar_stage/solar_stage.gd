extends StageConfiguration
class_name SolarStage

func _init() -> void:
	minimum_dangerous_entities = .4
	harmless_entities = [
		preload("res://entities/planet/planet.tscn"), # PASSIVE
		preload("res://entities/meteorite/meteorite.tscn"), # DANGEROUS
	]
	dangerous_entities = [
		preload("res://entities/ufo/ufo.tscn"), # DANGEROUS
	]
