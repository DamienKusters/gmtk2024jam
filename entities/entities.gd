extends Node2D

@onready var spawner = %Spawner

const GROWTH_SPEED = 3

var entities = [
	preload("res://entities/bird/bird.tscn")
]

var growth_position = Vector2.ZERO

func _ready():
	Game.dna_updated.connect(animate_growth_position)

var _position_tween: Tween
func animate_growth_position(dna_score: int):
	growth_position = Vector2(0, Game.DNA_SCORE_HEIGHT_VALUE * dna_score)
	var _tween = Game.animate(self, _position_tween)
	_tween.tween_property(self, "position", growth_position, GROWTH_SPEED)
	_tween.set_ease(Tween.EASE_OUT)

func _on_timer_timeout() -> void:
	var entity = get_entity().instantiate()
	entity.position = spawner.get_random_spawn_point() - self.position
	add_child(entity)

func get_entity() -> PackedScene:
	randomize()
	return entities[randi_range(0, entities.size() - 1)]
