extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (PackedScene) var sword
onready var sword_cooldown = get_node("sword_cooldown")
onready var spawnpoint = get_node("spawnpoint")
# Called when the node enters the scene tree for the first time.
func _ready():
    pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
    if Input.is_action_just_pressed("p2_down"):
        self.set_position(self.get_position() + Vector2(0,64));
    if Input.is_action_just_pressed("p2_up"):
        self.set_position(self.get_position() + Vector2(0,-64));
    if Input.is_action_just_pressed("p2_sword"):
        print(sword_cooldown.get_remaining_time())
        if sword_cooldown.get_time_left() == 0:
            sword_cooldown.start()
            spawn(sword.instance());
func spawn(figure):
    self.get_parent().add_child(figure)
    figure.set_my_team(figure.team.RIGHT);
    figure.set_position(self.get_position())
