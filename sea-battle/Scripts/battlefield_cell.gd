extends Button


func _ready():
	self.connect("pressed", self, "_some_button_pressed")
	
func _some_button_pressed():
	GlobalVariables.selected_cell=self
