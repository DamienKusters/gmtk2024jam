extends MovementDespawner
class_name DirectionalMovementComponent

@export var speed = 700
@export var direction = Vector2.DOWN

func _process(delta: float) -> void:
	parent.position += direction * (delta * speed)
	super._process(delta)
