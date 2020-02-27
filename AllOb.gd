extends RigidBody2D

var mob_types = ["Small","Small2", "Large", "Double"]

func _ready():
	set_process(true)
	$Sprite.animation = mob_types[randi() % mob_types.size()]
	$Small.disabled = true
	$Small2.disabled = true
	$Large.disabled = true
	$Double.disabled = true


func _process(delta):
	if $Sprite.animation == "Small":
		$Small.disabled = false
	else:
		$Small.disabled = true
		
	if $Sprite.animation == "Small2":
		$Small2.disabled = false
	else:
		$Small2.disabled = true
		
	if $Sprite.animation == "Large":
		$Large.disabled = false
	else:
		$Large.disabled = true
		
	if $Sprite.animation == "Double":
		$Double.disabled = false
	else:
		$Double.disabled = true
		
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_NextOb_screen_exited():
	Global.Lspeed += 5
	Global.emit_signal("NextOb")
