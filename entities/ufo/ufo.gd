extends Entity
class_name UfoEntity

func _ready() -> void:
	projectile = preload("res://projectiles/falling_projectile/falling_projectile.tscn")
	dna_score = 3 # OVERRIDE
	weight = 3 # OVERRIDE
	particle_color_eat = Color.LIME_GREEN #Alien blood

func emit_projectile():
	if grabbed:
		return
	get_parent().call_deferred("add_child", instantiate_projectile())
