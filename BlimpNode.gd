extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	$Smoke.position.y = $BlimpBody/Position2D.global_position.y - 210



func _on_Area2D_body_entered(body):
	if body.is_in_group("Obstacle"):
		self.hit()

func hit():
	get_tree().reload_current_scene()

