extends Node2D
class_name Projectile

const SPEED = 700
const Y_DEADZONE = 1200

var dna_damage = 1

@export var alert_color := Color("ffff00")

func check_despawn():
	if position.y >= Y_DEADZONE:
		queue_free()
