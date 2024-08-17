extends Node2D

@onready var spawner = %Spawner

const GROWTH_SPEED = 3

var entities = [
	preload("res://entities/bird/bird.tscn")
]

func _on_timer_timeout() -> void:
	var entity = get_entity().instantiate()
	entity.position = spawner.get_random_spawn_point()
	add_child(entity)

func get_entity() -> PackedScene:
	randomize()
	return entities[randi_range(0, entities.size() - 1)]
