extends Node2D

const num_bugs = 11
var current_bug_index = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	# Comenzar mostrando el primer bug e ocultando el resto
	for i in range(1, num_bugs + 1):
		get_node("Bug" + str(i)).visible = (i == current_bug_index)

# Cambiar la visibilidad del bug
func change_bug():
	# Ocultar el bug actual
	get_node("Bug" + str(current_bug_index)).visible = false
	
	# Incrementar el índice
	current_bug_index += 1
	
	# Comprobar si hemos alcanzado el máximo
	if current_bug_index > num_bugs:
		current_bug_index = 1
	
	# Mostrar el siguiente bug
	get_node("Bug" + str(current_bug_index)).visible = true
