extends Entity
class_name MeteoriteEntity

func _ready() -> void:
	dna_score = 4 # OVERRIDE
	weight = 3 # OVERRIDE
	particle_color_eat = Color.DIM_GRAY # rocks
	randomize()
