extends StageConfiguration
class_name CreditsStage

func _init() -> void:
	harmless_entities = [
		preload("res://entities/red_blood_cell/red_blood_cell.tscn"), # PASSIVE
		preload("res://entities/whale/whale.tscn"), # PASSIVE
		preload("res://entities/jet/jet.tscn"), # PASSIVE
		preload("res://entities/planet/planet.tscn"), # PASSIVE
		preload("res://entities/meteorite/meteorite.tscn"), # DANGEROUS
	]
	dangerous_entities = [
		preload("res://entities/white_blood_cell/white_blood_cell.tscn"), # DANGEROUS
		preload("res://entities/octopus/octopus.tscn"), # DANGEROUS
		preload("res://entities/blowfish/blowfish.tscn"),
		preload("res://entities/chopper/chopper.tscn"), # DANGEROUS
		preload("res://entities/drone/drone.tscn"), # DANGEROUS
		preload("res://entities/ufo/ufo.tscn"), # DANGEROUS
	]
