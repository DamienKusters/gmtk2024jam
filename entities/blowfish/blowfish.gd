extends Entity
class_name BlowFishEntity

func _ready() -> void:
	dna_score = 5
	projectile = preload("res://projectiles/vector_projectile/vector_projectile.tscn")
	particle_color_eat = Color.SANDY_BROWN

func emit_projectile():
	get_parent().call_deferred("add_child", instantiate_projectile())
