extends ButtonEntity
class_name SceneButtonEntity

@export var scene_id = 99

func button_action():
	Game.to_stage.emit(scene_id)
