extends CharacterBody2D

@export var speed := 500
@export var bullet_scene : PackedScene
var can_shoot = true
var fire_rate = 0.2

func _ready() -> void:
	pass

func shoot():
		
	var bullet_instance = bullet_scene.instantiate()
	bullet_instance.global_position = $namlu.global_position
	
	bullet_instance.rotation = rotation
	
	bullet_instance.rotation_degrees -= 90
	
	get_tree().current_scene.add_child(bullet_instance)
	
	can_shoot = false
	await get_tree().create_timer(fire_rate).timeout
	can_shoot = true
	
func _process(delta: float) -> void:
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * speed
	move_and_slide()
	look_at(get_global_mouse_position())
	
	rotation_degrees += 90 

	# 3. ATEŞ ETME: Sol tık
	if Input.is_action_pressed("shoot") and can_shoot:
		shoot()
