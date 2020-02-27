extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():

	$Bellows.frame = 0
	$Pump.frame = 0
	$Centrifuge.frame = 0

func _input(event):
	if event is InputEventScreenTouch:
		flap()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var from = $Linkage/Piston/Connector.global_position
	var to = $Linkage/LrgGear/Connector2.global_position
	
	createLine(from, to)

func flap():
	$AirHoseAnim.play("AirHoseanim")
	$Bellows.play("Bellows")

	
func createLine(from, to):
	$Linkage/Line2D.clear_points()
	$Linkage/Line2D.add_point(from)
	$Linkage/Line2D.add_point(to)
#	yield(get_tree(), "idle_frame")



func _on_Bellows_animation_finished():
	$Bellows.stop()
	$Pump.play("Pump")
	$Centrifuge.play("Centrifuge")
	$BigNeedleAnim.play("BigNeedleAnim")
	$Linkage/LinkageAnim.play("LinkageAnim")
	$Bellows.frame = 0


func _on_Pump_animation_finished():
	$Pump.stop()
	$Pump.frame = 0

func _on_Centrifuge_animation_finished():
	$Centrifuge.stop()
	$Centrifuge.frame = 0
