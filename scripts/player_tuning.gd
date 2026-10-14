class_name PlayerTuning
extends Resource
## Valores de tacto del movimiento del jugador. Se editan desde el inspector
## en data/player_tuning.tres. Aquí no hay lógica, solo parámetros.

@export_group("Movimiento")
@export var max_speed := 300.0
@export var acceleration := 2200.0
@export var friction := 2600.0
@export var air_acceleration := 1600.0
@export var air_friction := 700.0

@export_group("Salto")
@export var jump_velocity := -560.0
@export var jump_cut_multiplier := 0.45   # al soltar el botón mientras sube, se recorta el salto
@export var coyote_time := 0.10           # margen para saltar justo tras salir del borde
@export var jump_buffer_time := 0.12      # margen para saltar justo antes de aterrizar

@export_group("Gravedad")
@export var gravity_up := 1500.0
@export var gravity_down := 2300.0
@export var max_fall_speed := 1100.0
