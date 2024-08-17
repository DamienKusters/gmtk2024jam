extends CPUParticles2D

func _ready() -> void:
	self.finished.connect(func(): queue_free())
	self.emitting = true
