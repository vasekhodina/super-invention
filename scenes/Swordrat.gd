extends Area2D

enum team {LEFT = 1, RIGHT = -1}
export var health = 10 setget set_health, get_health
export var attack_val = 2
export var speed = 200
export var my_team = team.LEFT setget set_my_team, get_my_team

var velocity = Vector2()
var targets = []
onready var attack_timer = get_node("AttackTimer")

# Called when the node enters the scene tree for the first time.
func _ready():
        velocity = Vector2(speed, 0)
    
func _process(delta):
    cleanup_targets()
    if health <= 0:
        die()
    set_position(get_position() + velocity * delta * my_team)
    if attack_timer.get_time_left() == 0 and not targets.empty() and health > 0:
        attack(targets.front())
        
func attack(target):
    target.hit(attack_val)
    attack_timer.start(1)
        
func hit(damage):
    set_health(get_health() - damage)
    print(name, health)
    
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
    if area_shape == 2 and self_shape == 2:
        velocity = Vector2()
    if area.get_my_team() != get_my_team() and (self_shape == 0 or self_shape == 1) and area_shape == 2:
        area.add_target(self)

func cleanup_targets():
    for target in targets:
        if not is_instance_valid(target):
            targets.erase(target)
