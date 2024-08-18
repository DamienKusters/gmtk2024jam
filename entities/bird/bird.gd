extends Entity
class_name BirdEntity

@onready var area_tentacle = $TentacleDetectArea
@onready var dropping = preload("res://projectiles/falling_projectile/falling_projectile.tscn")

func _ready() -> void:
	dna_score = 5 # OVERRIDE
	weight = 2 # OVERRIDE
	$Sprite.flip_h = not $HorizontalMovementComponentMovementComponent.facing_right
	area_tentacle.detected.connect(emit_projectile)

func emit_projectile():
	var dr = dropping.instantiate()
	dr.position = position
	get_parent().call_deferred("add_child", dr)
