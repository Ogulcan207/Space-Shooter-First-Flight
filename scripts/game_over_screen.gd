extends CanvasLayer

func _ready():
	# Sahne açılır açılmaz final skorunu yazdır
	$Score.text = "SCORE: " + str(GameManager.score)

func _on_restart_button_pressed():
	# 1. Oyunu "Çöz" (Donmayı kaldır)
	get_tree().paused = false
	
	# 2. Değerleri Sıfırla
	GameManager.score = 0
	GameManager.player_health = 100
	
	# 3. Sahneyi Yeniden Başlat
	get_tree().reload_current_scene()
	
	# Bu menü sahnesini bellekten sil (Zaten reload olunca gider ama garantilemek iyidir)
	queue_free()
	
func _on_restart_pressed() -> void:
# 1. Oyunu "Çöz" (Donmayı kaldır)
	get_tree().paused = false
	
	# 2. Değerleri Sıfırla
	GameManager.score = 0
	GameManager.player_health = 100
	
	# 3. Sahneyi Yeniden Başlat
	get_tree().reload_current_scene()
	
	# Bu menü sahnesini bellekten sil (Zaten reload olunca gider ama garantilemek iyidir)
	queue_free()
