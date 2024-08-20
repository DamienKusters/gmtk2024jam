extends Resource
class_name StageModel

var title: String
var icon: Texture2D
var stage: PackedScene
var music: AudioStream
var save_key: String

func _init(_title: String, _icon: Texture2D, _stage: PackedScene, _music: AudioStream, _save_key: String) -> void:
	self.title = _title
	self.icon = _icon
	self.stage = _stage
	self.music = _music
	self.save_key = _save_key
