extends Area2D
var damage = 20
var speed = 600
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free() # Replace with function body.

func _on_area_entered(area):
	if area.is_in_group("enemy"):
		# Kırmızı (düşman mermisi) değilse düşmanı vur
		if modulate != Color.RED: 
			area.queue_free()
			queue_free()
			GameManager.add_score(10)

func _on_body_entered(body: Node2D) -> void:
# Çarpan şey oyuncu grubunda mı?
	if body.is_in_group("player"):
		# Mermi kırmızı mı (Düşman mermisi mi)?
		if modulate == Color.RED:
			GameManager.take_damage(10)
			queue_free()
