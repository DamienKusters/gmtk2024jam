extends Projectile
class_name VectorProjectile

@onready var directional_movement = $DirectionalMovementComponent

func _ready() -> void:
	if directional_movement:
		directional_movement.direction = direction

var direction: Vector2:
	set(value):
		direction = value.normalized()
