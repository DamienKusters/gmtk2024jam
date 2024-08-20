extends ButtonEntity
class_name CreditsButtonEntity

func button_action():
	Game.to_stage.emit(5) # Credits Stage
