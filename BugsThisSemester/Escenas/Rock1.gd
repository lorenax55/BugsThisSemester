extends Sprite2D

var dragging = false
var original_position

func _ready():
	set_process_input(true)
	original_position = position

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				var mouse_position = get_viewport().get_mouse_position()
				var mouse_collision = get_viewport().get_canvas_transform().affine_inverse().origin
				var sprite_rect = Rect2(position.x - texture.get_width() * scale.x / 2, position.y - texture.get_height() * scale.y / 2, texture.get_width() * scale.x, texture.get_height() * scale.y)
				if sprite_rect.has_point(mouse_collision):
					print("drag = true")
					dragging = true
					original_position = position
					return
			else:
				dragging = false
				return
	if event is InputEventMouseMotion and dragging:
		print("dragea")
		position = get_global_mouse_position() - texture.get_size() * scale / 2
