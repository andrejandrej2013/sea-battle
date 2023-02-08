extends Control


func _ready():
	pass 

func _on_Button_pressed():

	if GlobalVariables.selected_cell:
		GlobalVariables.selected_cell.disabled=true 
		print("hit : "+str(GlobalVariables.selected_cell))

	else:
		print("can not hit")
