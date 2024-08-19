extends Entity
class_name PlanetEntity

var textures = [
	preload("res://entities/planet/planet_earth.png"),
	preload("res://entities/planet/planet_orange.png"),
	preload("res://entities/planet/planet_purple.png"),
]

func _ready() -> void:
	dna_score = 4 # OVERRIDE
	weight = 7 # OVERRIDE
	particle_color_eat = Color.DIM_GRAY # rocks
	randomize()
	$Sprite2D.texture = textures[randi_range(0, textures.size() - 1)]
