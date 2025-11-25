extends Area2D

var player = null # Oyuncuyu hafızada tutmak için değişken
@export var speed = 150
@export var bullet_scene : PackedScene

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	$shoottimer.timeout.connect(shoot)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player: # Eğer oyuncu ölmediyse (hala sahnedeyse)
			var direction = global_position.direction_to(player.global_position)
			# 2. HAREKET: O yöne doğru git
			position += direction * speed * delta
			# 3. DÖNME (Opsiyonel): Düşmanın burnu oyuncuya baksın
			look_at(player.global_position)
			rotation_degrees += 90

func shoot():
	if player == null or bullet_scene == null:
		return
		
	var bullet = bullet_scene.instantiate()
	
	# Eğer Marker2D (Namlu) eklediysen $Muzzle.global_position kullan.
	bullet.global_position = global_position 
	
	# Düşman zaten player'a baktığı (look_at) için mermi de player'a gidecek.
	bullet.rotation = rotation + deg_to_rad(-90)
	
	# Merminin düşman mermisi olduğunu belli etmek için rengini değiştirelim
	bullet.modulate = Color.RED 
	
	# Mermiyi sahneye ekle
	get_tree().current_scene.add_child(bullet)
