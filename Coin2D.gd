extends Area2D

@onready var CoinSound = $AudioStreamPlayer

func _on_body_entered(body):
	if body.get_name() == "PJ":
		CoinSound.play()
		$Sprite2D.visible = false
		var timer = Timer.new()
		add_child(timer)
		timer.wait_time = 0.21
		timer.one_shot = true
		timer.start()
		await timer.timeout  # Esperar el timeout del Timer
		queue_free()  # Elimina la moneda de la escena
		pass
