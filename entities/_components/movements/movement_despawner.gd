extends Node
class_name MovementDespawner

const LEFT_DEADZONE = -1000
const RIGHT_DEADZONE = 1000
const BOTTOM_DEADZONE = 0

var parent: Node2D

func _ready() -> void:
	parent = get_parent()

func _process(_delta: float) -> void:
	if parent.position.x >= RIGHT_DEADZONE:
		parent.queue_free()
	elif parent.position.x <= LEFT_DEADZONE:
		parent.queue_free()
	elif parent.position.y >= BOTTOM_DEADZONE:
		parent.queue_free()
