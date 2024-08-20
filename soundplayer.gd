extends Node

var effects = {
	"damage": preload("res://sound/kraken_damage.mp3"),
	"eat": preload("res://sound/kraken_eat.mp3"),
	"grab": preload("res://sound/grab.mp3"),
}

func _ready():
	Game.sound.connect(play_random_pitch)

func play_random_pitch(key: String):
	var aplayer = AudioStreamPlayer.new()
	aplayer.finished.connect(func(): aplayer.queue_free())
	aplayer.autoplay = true
	aplayer.bus = &"Sfx"
	aplayer.stream = effects[key]
	randomize()
	aplayer.pitch_scale = randf_range(0.7, 1.3)
	add_child(aplayer)
