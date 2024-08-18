extends CPUParticles2D
class_name ProjectileParticles

@onready var parent: Projectile = get_parent()

func _ready() -> void:
	color = parent.alert_color
