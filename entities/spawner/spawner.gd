extends Node2D
class_name Spawner

@onready var a = $A
@onready var b = $B

func get_random_spawn_point() -> Vector2:
	var ab: Spawner = a if randi_range(0,2) == 1 else b
	return ab.get_relative_spawn_point() + self.position

func get_relative_spawn_point() -> Vector2:
	randomize()
	return Vector2(
		randi_range(a.position.x, b.position.x),
		randi_range(a.position.y, b.position.y),
	) + self.position
