extends Entity
class_name ChopperEntity

func _ready() -> void:
	projectile = preload("res://projectiles/vector_projectile/vector_projectile.tscn")
	dna_score = 2 # OVERRIDE
	weight = 3 # OVERRIDE
	particle_color_eat = Color.DARK_OLIVE_GREEN
	if $TentacleXMovementComponent:
		randomize()
		$TentacleXMovementComponent.SPEED = randi_range(150, 200)

func _process(_delta: float) -> void:
	$Sprite.flip_h = (tentacle.position.x < global_position.x)

func emit_projectile():
	if grabbed:
		return
	var p: VectorProjectile = instantiate_projectile()
	p.direction = (tentacle.position - global_position).normalized()
	get_parent().call_deferred("add_child", p)
