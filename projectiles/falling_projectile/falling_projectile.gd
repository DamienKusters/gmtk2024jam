extends Projectile
class_name FallingProjectile

func _process(delta: float) -> void:
	position.y += delta * SPEED
	super.check_despawn()
