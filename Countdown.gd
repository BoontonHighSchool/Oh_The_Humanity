extends RichTextLabel


#s is seconds
var s = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_text(str(s))
	
	if s == 0:
		self.hide()
		$Timer.stop()

	

func _on_Timer_timeout():
	s -= 1
