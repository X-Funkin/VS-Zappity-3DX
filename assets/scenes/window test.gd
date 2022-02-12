extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_accept"):
		$Timer.start()
		yeah = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var yeah = 0
func _on_Timer_timeout():
	match yeah:
		0:
			$"gf".open()
			$Timer.start(0.3)
		1:
			$"bf".open()
			$"Timer".start(1)
		
		3:
			$"gf".close()
			$"bf".close()
		_:
			$"Timer".start(1)
	yeah += 1
	pass # Replace with function body.
