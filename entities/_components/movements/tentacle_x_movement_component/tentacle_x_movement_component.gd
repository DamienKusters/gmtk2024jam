extends MovementDespawner
class_name TentacleXMovementComponent

@export var SPEED = 200

func _process(delta: float) -> void:
	var speed = delta * SPEED
	
	if parent.position.x > parent.tentacle.position.x:
		speed = speed * -1 # Inver t
	parent.position.x += speed
	super._process(delta)
