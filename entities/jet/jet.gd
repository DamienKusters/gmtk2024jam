extends Entity
class_name JetEntity

func _ready() -> void:
	dna_score = 2 # OVERRIDE
	weight = 3 # OVERRIDE
	$Sprite.flip_h = not $HorizontalMovementComponentMovementComponent.facing_right
