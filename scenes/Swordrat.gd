extends Area2D

enum team {LEFT = 1, RIGHT = -1}
export var health = 10 setget set_health, get_health
export var attack_val = 2
export var speed = 200
export var my_team = team.LEFT setget set_my_team, get_my_team

var velocity = Vector2()
var enemy_detected = false
var targets = []
onready var attack_timer = get_node("AttackTimer")

# Called when the node enters the scene tree for the first time.
func _ready():
        velocity = Vector2(speed, 0)
    
func _process(delta):
    if not enemy_detected:
        set_position(get_position() + velocity * delta * my_team)
    if not targets.empty():
        attack()
    if health <= 0:
        die()
        
func attack():
    if attack_timer.get_time_left() == 0:
        targets.front().hit(attack_val)
        attack_timer.start()
        
func hit(damage):
    set_health(get_health() - damage)
    
func die():
    queue_free()

func set_my_team(team):
    my_team = team
    
func get_my_team():
    return my_team

func set_health(value):
    health = value
    
func get_health():
    return health
    
func add_target(enemy):
    targets.append(enemy)

func _on_Swordrat_area_shape_entered(area_id, area, area_shape, self_shape):
    enemy_detected = true
    area.add_target(self)
