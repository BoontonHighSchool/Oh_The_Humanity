extends RigidBody2D

#onready var screen_size = get_viewport_rect().size

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.playback_speed = 1.5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
#	self.position += linear_velocity * delta
#	self.position.y = clamp(position.y, 0, screen_size.y)

	
	if self.rotation_degrees < -15:
		self.rotation_degrees = -15
		self.angular_velocity = 0

	if self.linear_velocity.y > 0:
		self.angular_velocity = 0.25
	


func _input(event):
	if event is InputEventScreenTouch:
		flap()

func flap():
	self.linear_velocity.y = -100
	self.angular_velocity = -1
	$AnimationPlayer.play("BlimpFlap")

func hit():
	get_tree().reload_current_scene()

func _on_BlimpBody_body_shape_entered(body_id, body, body_shape, local_shape):
	if body.is_in_group("Obstacle"):
		self.hit()

func _on_BlimpBody_body_entered(body):
	if body.is_in_group("Obstacle"):
		self.hit()


