extends Entity
class_name DroneEntity

func _ready() -> void:
	projectile = preload("res://projectiles/vector_projectile/vector_projectile.tscn")
	dna_score = 2 # OVERRIDE
	weight = 3 # OVERRIDE

var dirs = [
	Vector2(1,1),
	Vector2(-1,1),
	Vector2(-1,-1),
	Vector2(1,-1)
]

func emit_projectile():
	if grabbed:
		return
	for d in dirs:
		var projectile: VectorProjectile = instantiate_projectile()
		projectile.direction = d.normalized()
		get_parent().call_deferred("add_child", projectile)
