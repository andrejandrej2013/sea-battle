extends Node

const DEFAULT_PORT=9999
const MAX_CLIENTS=2

var server = null
var client= null

var ip_address=""

func _ready()->void:
	if OS.get_name()=="Windows":
		ip_address=IP.get_local_addresses()[3]
	elif OS.get_name()=="Android":
		ip_address=IP.get_local_addresses()[0]
	else:
		ip_address=IP.get_local_addresses()[3]
	for ip in IP.get_local_addresses():
		if ip.begins_with("192.168."):
			ip_address = ip
			
	get_tree().connect("connected_to_server",self,"_connected_to_server")
	get_tree().connect("server_disconnected",self,"_server_disconnected")
	get_tree().connect("connection_failed", self, "_connection_failed")



func create_server() -> void:
	server = NetworkedMultiplayerENet.new()
	server.create_server(DEFAULT_PORT, MAX_CLIENTS)
	get_tree().set_network_peer(server)
	#GlobalVariables.instance_node(load("res://Server_advertiser.tscn"), get_tree().current_scene)

func join_server() -> void:
	client = NetworkedMultiplayerENet.new()
	client.create_client(ip_address, DEFAULT_PORT)
	get_tree().set_network_peer(client)
	#client_connection_timeout_timer.start()

func reset_network_connection() -> void:
	if get_tree().has_network_peer():
		get_tree().network_peer = null

func _connected_to_server() -> void:
	print("Successfully connected to the server")
	
	#client_connected_to_server = true

func _server_disconnected() -> void:
	print("Disconnected from the server")
	
	#for child in Persistent_nodes.get_children():
	#	if child.is_in_group("Net"):
	#		child.queue_free()
	
	reset_network_connection()
	
	#if Global.ui != null:
	#	var prompt = Global.instance_node(load("res://Simple_prompt.tscn"), Global.ui)
	#	prompt.set_text("Disconnected from server")

func _client_connection_timeout():
	#if client_connected_to_server == false:
		print("Client has been timed out")
		
		reset_network_connection()
		
	#	var connection_timeout_prompt = Global.instance_node(load("res://Simple_prompt.tscn"), get_tree().current_scene)
	#	connection_timeout_prompt.set_text("Connection timed out")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
