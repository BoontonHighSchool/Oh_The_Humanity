extends Node

export (PackedScene) var Blimp

export (PackedScene) var Ob_types

onready var GrassSpeed = 0
onready var HillsSpeed = 0

func _ready():
	set_process(true)
	randomize()
	Global.connect("NextOb", self, "_NextOb")
	$Countdown.show()

func _process(delta):
	$Grass.region_rect = Rect2(GrassSpeed, 0, 2800, 300)
	GrassSpeed += 5
	$Hills.region_rect = Rect2(HillsSpeed, 0, 1280, 700)
	HillsSpeed += 2

func _on_Start_timeout():
	yield(get_tree(), "idle_frame")
	var blimp = Blimp.instance()
	blimp.position = $BlimpSP.position
	add_child(blimp)
	_NextOb()


func _on_Ground_body_entered(body):
	if body.is_in_group("Blimp"):
		get_tree().reload_current_scene()

func _NextOb():
    $Path2D/PathFollow2D.set_offset(600)
    # Create a Mob instance and add it to the scene.
    var mob = Ob_types.instance()
    add_child(mob)
    # Set the mob's direction perpendicular to the path direction.
    var direction = $Path2D/PathFollow2D.rotation + PI / 2
    # Set the mob's position to a random location.
    mob.position = $Path2D/PathFollow2D.position
    # Add some randomness to the direction.
    
    mob.rotation = direction
    # Set the velocity (speed & direction).
    mob.linear_velocity = Vector2(-Global.Lspeed, 0)
#    mob.linear_velocity = mob.linear_velocity.rotated(direction)


