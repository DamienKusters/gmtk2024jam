extends Area2D

signal detected

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("tentacle"):
		var tentacle_position: Vector2 = area.get_parent().global_position
		detected.emit(tentacle_position)
