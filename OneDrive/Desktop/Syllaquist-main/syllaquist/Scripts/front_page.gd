extends Node2D

var bubble_scene = [preload("res://FrontPage Scene/bubble.tscn")]
var cloud_scene = [preload("res://FrontPage Scene/cloud.tscn")]

@onready var bubble_container = $BubbleSpawn
@onready var Bubble_timer = $BubbleTimer
@onready var cloud_container = $CloudSpawn
@onready var cloud_timer = $CloudTimer

func _ready() -> void:
	Bubble_timer.wait_time = 1.0 
	Bubble_timer.autostart = true
	Bubble_timer.start()
	
	cloud_timer.wait_time = 3.0
	cloud_timer.autostart = true
	cloud_timer.start()

func spawn_bubble_u():
	var random_bubble_pos = bubble_scene[randi() % len(bubble_scene)].instantiate()
	random_bubble_pos.global_position = Vector2(randf_range(50, 500), 1270)
	bubble_container.add_child(random_bubble_pos)


func _on_bubble_timer_timeout() -> void:
	spawn_bubble_u()


func _on_play_button_pressed() -> void:
	var line_edit = get_node("EnterYourName/TextureRect/LineEdit")
	var player_name = line_edit.text

	if player_name == "":
		print("No name entered.")
		return
	else:
		# Save the name
		var file = FileAccess.open("user://user_data.txt", FileAccess.WRITE)
		if file:
			file.store_string(player_name)
			file.close()
		else:
			print("Failed to save name.")
			return 

		# Load the name back
		var read_file = FileAccess.open("user://user_data.txt", FileAccess.READ)
		if read_file:
			var saved_name = read_file.get_line()
			print("Loaded name:", saved_name)
		else:
			print("No saved name data.")


func _on_cloud_timer_timeout() -> void:
	spawn_cloud()

func spawn_cloud():
	var random_cloud_pos = cloud_scene[randi() % len(cloud_scene)].instantiate()
	var screen_height = get_viewport_rect().size.x
	random_cloud_pos.global_position = Vector2(-100, randf_range(0, screen_height))
	cloud_container.add_child(random_cloud_pos)
