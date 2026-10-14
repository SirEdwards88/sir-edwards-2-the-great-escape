extends Node2D
## Reinicio rápido de las escenas de prueba: la acción «restart» recarga la escena.
## Provisional: sin puntos de control ni gestión de niveles.

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
