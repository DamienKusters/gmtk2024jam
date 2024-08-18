extends Node2D

@onready var mouth_open = preload("res://kraken/mouth/mouth_open.png")
@onready var mouth_closed = preload("res://kraken/mouth/mouth_rest.png")

@onready var blood_particles = preload("res://particles/blood_particles.tscn")

func _on_feed_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("entity"):
		var entity = area.get_parent() as Entity
		$Mouth.texture = mouth_closed
		entity.eat()
		spawn_particles(blood_particles, entity)
		get_parent().entity_eaten.emit()

func spawn_particles(particles: PackedScene, entity: Entity):
	var p: CPUParticles2D = particles.instantiate()
	p.color = entity.particle_color_eat
	add_child(p)
	
func _update_mouth_texture(area: Area2D) -> void:
	$Mouth.texture = mouth_closed if !_entity_is_nearby() else mouth_open

func _entity_is_nearby():
	for area in $OpenMouthArea.get_overlapping_areas():
		if area.is_in_group("entity"):
			return true
	return false
