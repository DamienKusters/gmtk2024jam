extends Entity
class_name BirdEntity

@onready var area_tentacle = $TentacleDetectArea
@onready var dropping = preload("res://projectiles/falling_projectile/falling_projectile.tscn")

const SPEED = 300
const X_DEADZONE = 1000

var flying_right = true

func _ready() -> void:
	flying_right = position.x <= 0
	$Sprite.flip_h = not flying_right
	area_tentacle.detected.connect(emit_projectile)

func _process(delta: float) -> void:
	var speed = delta * SPEED
	if not flying_right:
		speed = speed * -1 # Invert
	position.x += speed
	
	if flying_right and position.x >= X_DEADZONE:
		_destroy()
	elif not flying_right and position.x <= X_DEADZONE * -1:
		_destroy()

func emit_projectile():
	var dr = dropping.instantiate()
	dr.position = position
	get_parent().call_deferred("add_child", dr)

func _destroy():
	print('entity destroyed')
	queue_free()
