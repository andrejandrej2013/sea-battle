extends GridContainer


func _ready():
	#print(self.get_columns())
	for i in range(self.get_columns()):
		for j in range(self.get_columns()):
			var cell = preload("res://Scenes/battlefield_cell.tscn").instance()
			cell.rect_min_size = Vector2(50, 50)
			cell.name=str((str(i)+";"+str(j)))
			cell.toggle_mode= true
			cell.group=preload("res://groups/cell_buttongroup.tres")
			cell.size_flags_horizontal = SIZE_FILL + SIZE_EXPAND
			add_child(cell)
	for i in self.get_children():
		print(i)
	yield(get_tree(),"idle_frame")
	print(self.rect_size)
	
	#print(group.get_buttons())
	
