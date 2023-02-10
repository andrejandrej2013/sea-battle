extends Control


func _ready():
	
	pass 

func _on_Button_pressed():

	if GlobalVariables.selected_cell:
		GlobalVariables.selected_cell.disabled=true 
		print("hit : "+str(GlobalVariables.selected_cell))

	else:
		print("can not hit")


#####
func set_place_ship_theme():
	var theme = preload("res://style/battelfield_cell_style.tres")
	for i in GlobalVariables.cells:
		change_theme(i,theme)

func change_theme(button : Button, theme: Theme):
	button.set_theme(theme)
