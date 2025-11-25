extends Node2D

@export var enemy_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_enemyspawner_timeout() -> void:
# 1. Düşman örneği oluştur
	var enemy = enemy_scene.instantiate()
	
	# 2. Rastgele bir pozisyon belirle
	# Ekranın genişliğine göre (Örneğin X: 50 ile 1200 arası)
	# Y: -50 yaptık ki ekranın biraz üstünden süzülerek girsin, "pıt" diye belirmesin.
	var random_x = randf_range(50, 1200)
	enemy.position = Vector2(random_x, -50)
	
	# 3. Sahneye ekle
	add_child(enemy)
