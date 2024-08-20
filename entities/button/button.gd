extends Entity
class_name ButtonEntity

func button_action():
	pass #OVERRIDE

func _ready() -> void:
	dna_score = 0 # OVERRIDE
	weight = 2 # OVERRIDE
	particle_color_eat = Color.GRAY
