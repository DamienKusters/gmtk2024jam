extends Area2D

signal detected

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("tentacle"):
		detected.emit()
