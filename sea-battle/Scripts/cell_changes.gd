extends Node
class_name Cell_changes





func set_place_ship_theme(theme:Theme):
	#var theme = preload(theme_path)
	for i in GlobalVariables.cells:
		change_theme(i,theme)

func change_theme(button : Button, theme: Theme):
	button.set_theme(theme)


func set_place_ship_mode(function : String):
	for i in GlobalVariables.cells:
		change_button_function(i,function) 

func change_button_function(button : Button, new_function : String, old_function : String = ""):
	if button.is_connected("pressed", self, old_function):
		button.disconnect("pressed", self, old_function)
	button.connect("pressed", self, new_function,[button])
