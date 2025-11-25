extends CanvasLayer

func _ready():
	# Oyun başlarken menü gizli olsun
	visible = false

func _input(event):
	# Eğer "pause" (ESC) tuşuna basılırsa
	if event.is_action_pressed("pause"):
		toggle_pause()

func toggle_pause():
	# Mevcut duraklama durumunun tersini al (True ise False, False ise True yap)
	var is_paused = not get_tree().paused
	
	# 1. Oyunu durdur/başlat
	get_tree().paused = is_paused
	
	# 2. Menüyü göster/gizle
	visible = is_paused

func _on_resume_btn_pressed():
	# Devam et butonuna basınca toggle_pause() fonksiyonunu çağırıp kapatıyoruz
	toggle_pause()

func _on_quit_btn_pressed():
	# Oyunu kapat (Masaüstüne döner)
	get_tree().quit()
