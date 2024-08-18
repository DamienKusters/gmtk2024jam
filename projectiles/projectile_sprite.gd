extends Sprite2D
class_name ProjectileSprite

@onready var parent: Projectile = get_parent()

func _ready() -> void:
	material.set("shader_paramater/color",parent.alert_color);
