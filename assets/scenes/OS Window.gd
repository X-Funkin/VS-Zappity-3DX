tool
extends Control
class_name OSWindow

export(String) var window_title setget set_window_title
export(Array, NodePath) var boarder_points setget set_boarder_points
export(PackedScene) var window_scene setget set_window_scene 
export(NodePath) var window_node setget set_window_node

func set_window_node(n_node):
	window_node = n_node
	if not is_inside_tree(): yield(self, "ready")
	var node = get_node_or_null(window_node)
	if node:
		if node.get_parent():
			node.get_parent().remove_child(node)
#		for child in $Viewport.get_children():
#			child.queue_free()
		$Viewport.add_child(node)


func set_window_title(n_title):
	window_title = n_title
	if not is_inside_tree(): yield(self, "ready")
	$VBoxContainer/Title.text = window_title
	update_window()

func set_boarder_points(n_points):
	boarder_points = n_points
	if not is_inside_tree(): yield(self, "ready")
	print("yeahhh")
	var point_array : PoolVector2Array
	for node_path in boarder_points:
		var node = get_node_or_null(node_path)
		if node is Control:
			point_array.append($Line2D.global_transform.affine_inverse()*node.rect_global_position)
	$Line2D.points = point_array

func set_window_scene(n_scene):
	window_scene = n_scene
	if not is_inside_tree(): yield(self, "ready")
#	for node in $Viewport.get_children():
#		node.queue_free()
	$Viewport.add_child(window_scene.instance())

func update_window():
	self.boarder_points = boarder_points
	$Viewport.size = $"VBoxContainer/Main".rect_size

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func open():
	$"Window Animations".play("Open")

func close():
	$"Window Animations".play("Close")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_OS_Window_item_rect_changed():
	update_window()
	pass # Replace with function body.


func _on_OS_Window_resized():
	update_window()
	pass # Replace with function body.


func _on_ColorRect_resized():
	update_window()
	pass # Replace with function body.


func _on_Title_resized():
	update_window()
	pass # Replace with function body.
