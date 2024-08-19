extends Node2D

@onready var tentacle_open = preload("res://kraken/tentacle/tentacle_open.png")
@onready var tentacle_closed = preload("res://kraken/tentacle/tentacle_close.png")

const DRAG_SPEED = .2;

var grabbed_entity: Entity

func _process(delta: float) -> void:
	_tween_position(get_global_mouse_position() - get_parent().position, grabbed_entity)
	if grabbed_entity != null:
		grabbed_entity.global_position = global_position
	var angle_to_player = global_position.direction_to($"../TentaclePoint".position).angle()
	rotation = move_toward(rotation, angle_to_player, delta)

var _tween: Tween
func _tween_position(_global_mouse_position: Vector2, _grabbed_entity):
	var drag_weight_slower = 1 if grabbed_entity == null or grabbed_entity is not Entity else grabbed_entity.weight
	_tween = Game.animate(self, _tween)
	_tween.tween_property(self, 'position', _global_mouse_position, DRAG_SPEED * drag_weight_slower)

func _input(_event):
	if _event is InputEventMouseButton and _event.is_action_pressed("grab"):
		grabbed_entity = grab_entity()
		if grabbed_entity:
			grabbed_entity.grabbed = true
		$Tentacle.texture = tentacle_closed
		Game.sound.emit(&'grab')
	elif _event is InputEventMouseButton and _event.is_action_released("grab"):
		if grabbed_entity and is_instance_valid(grabbed_entity):
			grabbed_entity.grabbed = false
		grabbed_entity = null
		$Tentacle.texture = tentacle_open
		Game.sound.emit(&'grab')
		
func grab_entity() -> Entity:
	for area in $Grabber.get_overlapping_areas():
		if area.is_in_group("entity"):
			return area.get_parent()
	return null
