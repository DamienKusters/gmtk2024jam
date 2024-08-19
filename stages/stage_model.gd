extends Resource
class_name StageModel

var title: String
var icon: Texture2D
var stage: PackedScene
var music: AudioStream

func _init(_title: String, _icon: Texture2D, _stage: PackedScene, _music: AudioStream) -> void:
	self.title = _title
	self.icon = _icon
	self.stage = _stage
	self.music = _music
