extends Node2D
class_name Projectile

var dna_damage = 1
var timeout_timer: Timer

func _ready() -> void:
	timeout_timer = Timer.new()
	timeout_timer.wait_time = 10
	timeout_timer.autostart = true
	timeout_timer.timeout.connect(func(): queue_free())
	add_child(timeout_timer)

func tentacle_hit(_area: Area2D) -> void:
	Game.dna_score -= dna_damage
	queue_free()
