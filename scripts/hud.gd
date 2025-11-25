extends CanvasLayer
@onready var score_label = $Control/ScoreLabel
@onready var health_bar = $Control/HealthBar

func _ready():
	# 1. Başlangıç değerlerini güncelle
	update_score_text(GameManager.score)
	health_bar.value = GameManager.player_health
	
	# 2. GameManager sinyallerini dinlemeye başla
	# Skor değişince -> update_score_text çalışsın
	GameManager.score_changed.connect(update_score_text)
	
	# Can değişince -> update_health_bar çalışsın
	GameManager.health_changed.connect(update_health_bar)

# Skoru güncelleyen fonksiyon
func update_score_text(new_score):
	score_label.text = "SCORE: " + str(new_score)
	
# Can barını güncelleyen fonksiyon
func update_health_bar(new_health):
	health_bar.value = new_health
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
