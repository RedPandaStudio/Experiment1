extends TextureButton

func _ready():
	connect("pressed", self, "_on_pressed")
	pass
	
func _on_pressed(): 
	get_tree().change_scene("res://Worlds/World.tscn")
	pass
