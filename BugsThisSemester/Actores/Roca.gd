extends Node2D

var draggable = false
var offset = Vector2.ZERO
var rock_nodes : Array = []


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(1, 7):
		var rock = get_node("Rock" + str(i))
		rock_nodes.append(rock)
		print(i)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("Click"):
			offset =  global_position - get_global_mouse_position()
			global_position = get_global_mouse_position() + offset
		elif Input.is_action_pressed("Click"):
			global_position = get_global_mouse_position() + offset
		elif Input.is_action_just_released("Click"):
			draggable = false
	pass

func _on_area_2d_mouse_entered():
	draggable = true
	scale = Vector2(1.35,1.35)
	
func _on_area_2d_mouse_exited():
	draggable = false
	offset = Vector2.ZERO
	scale = Vector2(1.3,1.3)

func _on_texture_button_pressed():
	pass # Replace with function body.

func change_rock():
	global_position = Vector2(0,0)
	var index = randi() % 6 
	print(index)
	for i in range(rock_nodes.size()):
		if i == index:
			rock_nodes[i].visible = true
		else:
			rock_nodes[i].visible = false	
