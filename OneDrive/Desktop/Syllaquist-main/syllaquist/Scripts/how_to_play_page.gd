extends Node2D

var cloud_scene = [preload("res://FrontPage Scene/cloud.tscn")]

@onready var cloud_container = $CloudSpawn
@onready var cloud_timer = $CloudTimer

func _ready() -> void:
	cloud_timer.wait_time = 3.0
	cloud_timer.autostart = true
	cloud_timer.start()


func _on_cloud_timer_timeout() -> void:
	spawn_cloud()
	
func spawn_cloud():
	var random_cloud_pos = cloud_scene[randi() % len(cloud_scene)].instantiate()
	var screen_height = get_viewport_rect().size.x
	random_cloud_pos.global_position = Vector2(-100, randf_range(0, screen_height))
	cloud_container.add_child(random_cloud_pos)
