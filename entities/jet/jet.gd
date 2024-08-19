extends Entity
class_name JetEntity

func _ready() -> void:
	dna_score = 2 # OVERRIDE
	weight = 3 # OVERRIDE
	particle_color_eat = Color.SLATE_GRAY
	$Sprite.flip_h = not $HorizontalMovementComponentMovementComponent.facing_right
