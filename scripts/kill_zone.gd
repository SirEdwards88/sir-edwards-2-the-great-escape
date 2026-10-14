extends Area2D
## Zona de caída al vacío de las escenas de prueba: si el jugador entra, se
## reinicia la escena. Provisional: sin puntos de control ni causas de derrota.

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		get_tree().reload_current_scene.call_deferred()
