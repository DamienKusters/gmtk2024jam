extends Entity
class_name ChopperEntity

func _ready() -> void:
	projectile = preload("res://projectiles/vector_projectile/vector_projectile.tscn")
	dna_score = 2 # OVERRIDE
	weight = 3 # OVERRIDE

func emit_projectile():
	var projectile: VectorProjectile = instantiate_projectile()
	projectile.direction = (tentacle.position - global_position).normalized()
	get_parent().call_deferred("add_child", projectile)
