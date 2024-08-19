extends Entity
class_name OctopusEntity

@onready var area_tentacle = $TentacleDetectArea

func _ready() -> void:
	projectile = preload("res://projectiles/falling_projectile/falling_projectile.tscn")
	dna_score = 2 # OVERRIDE
	weight = 2 # OVERRIDE
	particle_color_eat = Color.BLACK # ink
	$Sprite.flip_h = not $DiagonalMovementComponentMovementComponent.facing_right
	if area_tentacle:
		area_tentacle.detected.connect(emit_projectile)

func emit_projectile(_tentacle_position: Vector2):
	get_parent().call_deferred("add_child", instantiate_projectile())
