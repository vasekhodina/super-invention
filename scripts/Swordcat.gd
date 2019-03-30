extends KinematicBody2D

enum team {LEFT, RIGHT}
export var health = 10
export var attack = 2
export var speed = 200
export var my_team = team.LEFT setget set_my_team, get_my_team

var velocity = Vector2()
var enemy_detected = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
    if my_team == team.LEFT:
        velocity = Vector2(speed, 0)
    if my_team == team.RIGHT:
        velocity = Vector2(-speed, 0)
    
func _process(delta):
    move_and_collide(velocity * delta)

func set_my_team(team):
    my_team = team
    
func get_my_team():
    return my_team