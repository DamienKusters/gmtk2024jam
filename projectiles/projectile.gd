extends Node2D
class_name Projectile

const SPEED = 700
const Y_DEADZONE = 1200

func check_despawn():
	if position.y >= Y_DEADZONE:
		queue_free()
