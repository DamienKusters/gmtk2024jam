extends Node2D

@onready var blood_particles = preload("res://particles/blood_particles.tscn")

func _on_feed_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("entity"):
		var entity = area.get_parent() as Entity
		entity.eat()
		spawn_particles(blood_particles) # TODO get particles from entity
		get_parent().entity_eaten.emit() #TODO grow size

func spawn_particles(particles: PackedScene):
	add_child(particles.instantiate())
	
