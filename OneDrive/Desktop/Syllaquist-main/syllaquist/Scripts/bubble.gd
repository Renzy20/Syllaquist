extends Area2D

@export var speed = 300

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_pos(delta)

func global_pos(delta):
	global_position.y += -speed * delta
	
