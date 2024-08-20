extends ButtonEntity
class_name PlayButtonEntity

func button_action():
	Game.to_stage.emit(0) # Cell Stage
