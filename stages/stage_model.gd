extends Resource
class_name StageModel

var title: String
var icon: Texture2D
var stage: PackedScene

func _init(title: String, icon: Texture2D, stage: PackedScene) -> void:
	self.title = title
	self.icon = icon
	self.stage = stage
