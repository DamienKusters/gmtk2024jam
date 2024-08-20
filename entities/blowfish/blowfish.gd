extends Entity
class_name BlowFishEntity

func _ready() -> void:
	dna_score = 2
	projectile = preload("res://projectiles/vector_projectile/vector_projectile.tscn")
	particle_color_eat = Color.SANDY_BROWN
	$Sprite.flip_h = not $DiagonalMovementComponentMovementComponent.facing_right
	if $DiagonalMovementComponentMovementComponent:
		randomize()
		$DiagonalMovementComponentMovementComponent.SPEED = randi_range(280, 320)

func emit_projectile():
	if grabbed:
		return
	get_parent().call_deferred("add_child", instantiate_projectile())
