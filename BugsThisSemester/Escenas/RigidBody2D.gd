extends RigidBody2D

var original_position

func _ready():
	original_position = position

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				var mouse_position = get_viewport().get_mouse_position()
				var mouse_collision = to_local(mouse_position)
				if mouse_collision.x >= 0 and mouse_collision.x <= $CollisionShape2D.shape.extents.x * 2 and mouse_collision.y >= 0 and mouse_collision.y <= $CollisionShape2D.shape.extents.y * 2:
					position = get_global_mouse_position() - global_position
			else:
				position = original_position
