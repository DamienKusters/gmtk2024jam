extends Entity
class_name DroneEntity

func _ready() -> void:
	projectile = preload("res://projectiles/vector_projectile/vector_projectile.tscn")
	dna_score = 2 # OVERRIDE
	weight = 2 # OVERRIDE
	particle_color_eat = Color.DARK_SLATE_GRAY
	if $DiagonalMovementComponent:
		randomize()
		$DiagonalMovementComponent.SPEED = randi_range(280, 320)

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
		var p: VectorProjectile = instantiate_projectile()
		p.direction = d.normalized()
		get_parent().call_deferred("add_child", p)
