extends VBoxContainer

var stages = [
	&"cell",
	&"ocean",
	&"civ",
	&"solar",
	&"credits",
]

func _ready() -> void:
	var i = 0
	var children = get_children()
	for child in children:
		var score = Save.get_stage_score(stages[i])
		child.visible = score != -1
		child.get_child(1).text = Ui.to_time_string(score)
		i += 1
