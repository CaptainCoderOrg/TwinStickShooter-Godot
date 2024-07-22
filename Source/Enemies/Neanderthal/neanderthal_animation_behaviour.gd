class_name NeanderthalAnimationBehaviour
extends Node

@onready var body : CharacterBody2D = owner
@export var is_moving : bool :
	get:
		return body and not body.velocity.is_zero_approx()
