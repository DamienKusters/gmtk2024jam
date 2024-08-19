extends Entity
class_name ChopperEntity

func _ready() -> void:
	projectile = preload("res://projectiles/vector_projectile/vector_projectile.tscn")
	dna_score = 2 # OVERRIDE
	weight = 3 # OVERRIDE

func _process(delta: float) -> void:
	$Sprite.flip_h = (tentacle.position.x < global_position.x)

func emit_projectile():
	if grabbed:
		return
	var projectile: VectorProjectile = instantiate_projectile()
	projectile.direction = (tentacle.position - global_position).normalized()
	get_parent().call_deferred("add_child", projectile)
