extends Entity
class_name WhaleEntity

func _ready() -> void:
	dna_score = 3 # OVERRIDE
	weight = 3 # OVERRIDE
	$Sprite.flip_h = not $HorizontalMovementComponentMovementComponent.facing_right
