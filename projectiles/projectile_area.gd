extends Area2D
class_name ProjectileArea

@onready var parent: Projectile = get_parent()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("tentacle"):
		parent.tentacle_hit(area)
