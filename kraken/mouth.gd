extends Node2D

@onready var blood_particles = preload("res://particles/blood_particles.tscn")

func _on_feed_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("entity"):
		var entity = area.get_parent() as Entity
		entity.eat()
		spawn_particles(blood_particles, entity)
		get_parent().entity_eaten.emit()

func spawn_particles(particles: PackedScene, entity: Entity):
	var p: CPUParticles2D = particles.instantiate()
	p.color = entity.particle_color_eat
	add_child(p)
	
