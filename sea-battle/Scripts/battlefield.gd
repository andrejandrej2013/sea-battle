extends GridContainer

var Standard_mode= GlobalVariables.Standard_mode_build.new()

func _ready():
	GlobalVariables.direcation=false
	
	#column_count = self.get_columns()
	#row_count = self.get_columns()
	
	var theme = preload("res://style/battelfield_cell_style.tres")
	
	for i in range(Standard_mode.row_count):
		for j in range(Standard_mode.column_count):
			var cell = Button.new()
			#where i is row and j is column
			cell.set_name(str(i)+";"+str(j))
			#cell.toggle_mode= true
			cell.group=preload("res://groups/cell_buttongroup.tres")
			cell.set_theme(theme)
			cell.size_flags_horizontal = SIZE_FILL + SIZE_EXPAND
			cell.size_flags_vertical = SIZE_FILL + SIZE_EXPAND
			GlobalVariables.cells.append(cell)
			add_child(cell)
			
	yield(get_tree(),"idle_frame")
	set_place_ship_mode()
	print(self.rect_size)


func set_place_ship_mode():
	for i in GlobalVariables.cells:
		change_button_function(i,"place_ship")


func change_color(button: Button, color: Color):
	var theme = Theme.new()
	theme.set_color("disabled", "Button", color)
	#button.modulate = Color(1,1,1,1)
	button.set_theme(theme)

func change_button_function(button : Button, new_function : String, old_function : String = ""):
	if button.is_connected("pressed", self, old_function):
		button.disconnect("pressed", self, old_function)
	button.connect("pressed", self, new_function,[button])

func place_ship(button : Button)->void:
	#GlobalVariables.direcation :
	#0 -> horizontal
	#1 -> vertical
	
	var ship_size=Standard_mode.get_ship()
	
	
	var button_position = button.get_name().split(";", false, 1)
	
	if GlobalVariables.direcation==false:
		if int(button_position[1])+ship_size<=Standard_mode.column_count:
			Standard_mode.remove_ship()
			var button_index : int = GlobalVariables.cells.find(button)
			#print(button_index)
			for i in range(button_index,button_index+ship_size):
				GlobalVariables.cells[i].disabled=true
			
			GlobalVariables.horizontal_ships.append(GlobalVariables.cells.slice(button_index, button_index+ship_size-1))
		else:
			print("cant pick this place for ship position")
	else:
		if int(button_position[0])+ship_size<=Standard_mode.row_count:
			Standard_mode.remove_ship()
			var button_index : int = GlobalVariables.cells.find(button)
			#print(button_index)
			var ship_cells=[]
			
			for i in range(button_index,button_index+(ship_size*Standard_mode.row_count),Standard_mode.row_count):
				ship_cells.append(GlobalVariables.cells[i])
				GlobalVariables.cells[i].disabled=true

			GlobalVariables.vertical_ships.append(ship_cells)
			#
			#button.disabled=true
			#print("disable : "+str(button.get_name()))
		else:
			print("cant pick this place for ship position")
	if !Standard_mode.ships[Standard_mode.ships.keys()[-1]]:
		#print(GlobalVariables.cells)
		print("horizontal_ships : ",GlobalVariables.horizontal_ships)
		print("vertical_ships : ",GlobalVariables.vertical_ships)
	


func _some_button_pressed(cell):
	GlobalVariables.selected_cell=cell
