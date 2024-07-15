class_name EnemyHealthBehaviour
extends Node

@export var health : float = 1

func take_damage(damage : float) -> void:
	health -= damage
	if health <= 0:
		death()

func death() -> void:
	owner.queue_free()

func _on_hit_box_area_entered(area : Area2D):
	var projectile : Projectile = area.owner as Projectile
	if projectile:
		take_damage(projectile.damage)
		
