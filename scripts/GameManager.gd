extends Node

# Global değişkenler
var score = 0
var player_health = 100
var game_over_scene = preload("res://scenes/game_over_screen.tscn")
# Sinyaller (Değişiklik olunca UI'a haber vermek için)
signal score_changed(new_score)
signal health_changed(new_health)

func add_score(points):
	score += points
	score_changed.emit(score) # UI'a "Hey skor değişti!" diye bağırır

func take_damage(damage):
	player_health -= damage
	health_changed.emit(player_health)
	
	if player_health <= 0:
		game_over()

func game_over():
	print("GAME OVER!")
	
	# 1. Game Over ekranından bir örnek (instance) oluştur
	var go_instance = game_over_scene.instantiate()
	
	# 2. Ekrana ekle (Mevcut sahnenin içine)
	get_tree().current_scene.add_child(go_instance)
	
	# 3. Oyunu DONDUR
	# Bunu yaptığın an düşmanlar, mermiler, player her şey donar.
	# Sadece "Process Mode: Always" yaptığımız Game Over ekranı çalışır.
	get_tree().paused = true
