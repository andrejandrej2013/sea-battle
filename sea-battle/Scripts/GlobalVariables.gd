extends Node

#game's depended variables

var selected_cell : Button
#not shor where to save direction
var direcation :=false
var cells = []
var horizontal_ships = []
var vertical_ships = []


class Standard_mode_build:
	#var _pointer := 0
	#ships = {ship_size:ship_count}
	var ships = {4:1,3:2,2:3,1:4}
	var row_count = 10
	var column_count = 10
	var occupied_cells = []
	func get_ship():
		for i in ships:
			if ships[i]!=0:
				return i
		return 0
	func remove_ship():
		for i in ships:
			if ships[i]!=0:
				#print("before ",ships)
				ships[i]-=1
				return i
		return 0
		

var mode 


var current_scene = null

func instance_node_at_location(node:Object,parent:Object, location: Vector2) -> Object:
	var node_instance = instance_node(node, parent)
	node_instance.global_position = location
	return node_instance

func instance_node(node:Object,parent:Object)->Object:
	var node_instance = node.instance()
	parent.add_child(node_instance)
	return node_instance
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
