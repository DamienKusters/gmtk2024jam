extends Entity
class_name WhiteBloodCellEntity

@onready var area_tentacle = $TentacleDetectArea

var projectile_emitted = false

func _ready() -> void:
	dna_score = 2
	projectile = preload("res://projectiles/vector_projectile/vector_projectile.tscn")
	particle_color_eat = Color.WHITE_SMOKE
	if area_tentacle:
		area_tentacle.detected.connect(emit_projectile)

func emit_projectile(tentacle_position: Vector2):
	if projectile_emitted:
		return
	projectile_emitted = true
	var projectile: VectorProjectile = instantiate_projectile()
	projectile.direction = (tentacle_position - global_position).normalized()
	get_parent().call_deferred("add_child", projectile)
