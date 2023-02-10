extends Node
class_name Cell_changes





func set_theme(buttons : Array,theme:Theme):
	#var theme = preload(theme_path)
	
	for i in buttons:
		change_theme(i,theme)

func change_theme(button : Button, theme: Theme):
	button.set_theme(theme)

func get_coordinates(name : String):
	return name.split(";")
	
func set_mode(function : String):
	for i in GlobalVariables.cells:
		change_button_function(i,function) 

func change_button_function(button : Button, new_function : String, old_function : String = ""):
	if button.is_connected("pressed", self, old_function):
		button.disconnect("pressed", self, old_function)
	button.connect("pressed", self, new_function,[button])
