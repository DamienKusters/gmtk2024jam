extends Timer

func _ready() -> void:
	self.timeout.connect(randomise_next_time)
	
func randomise_next_time():
	randomize()
	self.wait_time = randf_range(0.8, 1.2)
