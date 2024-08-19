extends StageConfiguration
class_name OceanStage

func _init() -> void:
	minimum_dangerous_entities = .35
	harmless_entities = [
		preload("res://entities/whale/whale.tscn"), # PASSIVE
	]
	dangerous_entities = [
		preload("res://entities/octopus/octopus.tscn"), # DANGEROUS
		preload("res://entities/blowfish/blowfish.tscn"),
	]
