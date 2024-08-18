extends MovementDespawner
class_name DiagonalMovementComponent

const SPEED = 300
const X_DEADZONE = 1000

const MIN_ANGLE = -45
const MAX_ANGLE = 45

var facing_right = true
var direction = Vector2.RIGHT
var angled_direction: Vector2

func _ready() -> void:
	super._ready()
	facing_right = parent.position.x <= 0
	direction = Vector2.RIGHT if facing_right else Vector2.LEFT
	angled_direction = direction.rotated(deg_to_rad(_get_random_angle()))

func _process(delta: float) -> void:
	var speed = angled_direction * (delta * SPEED)
	parent.position += speed
	super._process(delta)


func _get_random_angle() -> float:
	return randf_range(MIN_ANGLE, MAX_ANGLE)
