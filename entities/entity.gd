extends Node2D
class_name Entity

var grabbed = false

func eat():
	grabbed = false
	queue_free()
