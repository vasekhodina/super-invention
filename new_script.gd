extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
    if Input.is_action_pressed("p1_down"):
        print("down")
        self.set_position(self.get_position() + Vector2(64,0));
    if Input.is_action_pressed("p1_up"):
        print("up")
        self.set_position(self.get_position() + Vector2(64,0));