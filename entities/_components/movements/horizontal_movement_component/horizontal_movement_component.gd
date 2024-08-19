extends MovementDespawner
class_name HorizontalMovementComponent

@export var SPEED = 300

var facing_right = true

func _ready() -> void:
	super._ready()
	facing_right = parent.position.x <= 0

func _process(delta: float) -> void:
	var speed = delta * SPEED
	if not facing_right:
		speed = speed * -1 # Invert
	parent.position.x += speed
	super._process(delta)
