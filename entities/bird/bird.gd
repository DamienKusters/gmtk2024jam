extends Entity
class_name BirdEntity

@onready var area_tentacle = $TentacleDetectArea

func _ready() -> void:
	projectile = preload("res://projectiles/falling_projectile/falling_projectile.tscn")
	dna_score = 5 # OVERRIDE
	weight = 2 # OVERRIDE
	$Sprite.flip_h = not $HorizontalMovementComponentMovementComponent.facing_right
	if area_tentacle:
		area_tentacle.detected.connect(emit_projectile)

func emit_projectile(_tentacle_position: Vector2):
	get_parent().call_deferred("add_child", instantiate_projectile())
