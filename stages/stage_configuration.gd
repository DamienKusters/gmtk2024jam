extends Node
class_name StageConfiguration

@onready var entities_node = $Entities
@onready var spawner_node = $Spawner
@onready var kraken: Kraken = $Kraken

# TODO: stage progresion scaling
# dna score = 0 - 100%
var minimum_dangerous_entities = .2 #20% spawn chance when dna score = 0%
var maximum_dangerous_entities = .9 #90% spawn chance when dna score = 100%
# This causes the stage to become more difficult the longer it goes on

var harmless_entities = []
var dangerous_entities = []

func entity_tick():
	var entity: Entity = get_entity().instantiate()
	entity.tentacle = kraken.get_tentacle()
	entity.position = spawner_node.get_random_spawn_point() - entities_node.position
	entities_node.add_child(entity)

func get_entity() -> PackedScene:
	randomize()
	if randf_range(0, 1) < _get_dangerous_entity_spawn_percentage():
		return dangerous_entities[randi_range(0, dangerous_entities.size() - 1)]
	return harmless_entities[randi_range(0, harmless_entities.size() - 1)]

func _get_dangerous_entity_spawn_percentage() -> float:
	return minimum_dangerous_entities + (maximum_dangerous_entities - minimum_dangerous_entities) * (Game.dna_score / 100.0)
	
