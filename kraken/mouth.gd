extends Node2D

@onready var mouth_open = preload("res://kraken/mouth/mouth_open.png")
@onready var mouth_closed = preload("res://kraken/mouth/mouth_rest.png")
@onready var blood_particles = preload("res://particles/blood_particles.tscn")

const GROWTH_SPEED = 3

func _ready() -> void:
	Game.dna_updated.connect(animate_growth_scale)

func _on_feed_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("entity"):
		var entity = area.get_parent() as Entity
		$Mouth.texture = mouth_closed
		entity.eat()
		Game.sound.emit(&"eat")
		spawn_particles(blood_particles, entity)
		if entity is ButtonEntity:
			entity.button_action()
		get_parent().entity_eaten.emit()

func spawn_particles(particles: PackedScene, entity: Entity):
	var p: CPUParticles2D = particles.instantiate()
	p.position = $ParticlePosition.position
	p.color = entity.particle_color_eat
	add_child(p)

var _scale_tween: Tween
func animate_growth_scale(dna_score: int):
	var growth_percentage = (Game.dna_score / 100.0) + 1
	var growth_scale = Vector2(growth_percentage, growth_percentage)
	var _tween = Game.animate(self, _scale_tween)
	_tween.tween_property(self, "scale", growth_scale, GROWTH_SPEED)
	_tween.set_ease(Tween.EASE_OUT)

func _update_mouth_texture(_area: Area2D) -> void:
	$Mouth.texture = mouth_closed if !_entity_is_nearby() else mouth_open

func _entity_is_nearby():
	for area in $OpenMouthArea.get_overlapping_areas():
		if area.is_in_group("entity"):
			return true
	return false
