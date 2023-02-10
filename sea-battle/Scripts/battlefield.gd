extends GridContainer

#var Standard_mode= GlobalVariables.Standard_mode_build.new()

func _ready():
	GlobalVariables.mode = GlobalVariables.Standard_mode_build.new()
	GlobalVariables.direcation=false
	
	#column_count = self.get_columns()
	#row_count = self.get_columns()
	
	var theme = preload("res://style/battelfield_cell_style.tres")
	
	for i in range(GlobalVariables.mode.row_count):
		for j in range(GlobalVariables.mode.column_count):
			var cell = Button.new()
			#where i is row and j is column
			cell.set_name(str(i)+";"+str(j))
			#cell.toggle_mode= true
			#cell.group=preload("res://groups/cell_buttongroup.tres")
			
			#cell.set_theme(theme)
			#change_button_function(cell,"place_ship")
			cell.size_flags_horizontal = SIZE_FILL + SIZE_EXPAND
			cell.size_flags_vertical = SIZE_FILL + SIZE_EXPAND
			GlobalVariables.cells.append(cell)
			add_child(cell)
			
	#set_place_ship_mode()
	yield(get_tree(),"idle_frame")
	print(self.rect_size)



func _some_button_pressed(cell):
	GlobalVariables.selected_cell=cell
