extends Control

export(String, MULTILINE) var text setget set_text
export(float) var visible_lines

func set_text(n_text):
	pass
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func update_text():
	for node in get_children():
		node.queue_free()
		node.visible = false
	var vbox = 0


func _input(event):
	if event.is_action_pressed("ui_accept"):
		$AnimationPlayer.play("start")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
