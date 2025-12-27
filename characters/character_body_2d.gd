extends CharacterBody2D

@export var speed := 300.0
@export var jump_velocity := -600.0
@export var max_health := 100.0
var health := 100

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += ProjectSettings.get_setting("physics/2d/default_gravity") * delta
		
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	
func _ready():
	health = max_health
	
func take_damage(amount):
	health -= amount
	health = clamp(health, 0, max_health)
	
func heal(amount):
	health += amount
	health = clamp(health, 0, max_health)
