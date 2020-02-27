extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$PlayerAnim.frame = 0
	$PlayerAnim.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event is InputEventScreenTouch:
		flap()
		
func flap():
	$PlayerAnim.play()


func _on_PlayerAnim_animation_finished():
	$PlayerAnim.stop()
	$PlayerAnim.frame = 0

