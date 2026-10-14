extends CharacterBody2D

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

var _coyote_timer := 0.0
var _buffer_timer := 0.0

func _physics_process(delta: float) -> void:
	var on_floor := is_on_floor()

	# Márgenes de tiempo
	if on_floor:
		_coyote_timer = coyote_time
	else:
		_coyote_timer = maxf(_coyote_timer - delta, 0.0)
	if Input.is_action_just_pressed("ui_accept"):
		_buffer_timer = jump_buffer_time
	else:
		_buffer_timer = maxf(_buffer_timer - delta, 0.0)

	# Gravedad (más fuerte al caer)
	if not on_floor:
		var g := gravity_up if velocity.y < 0.0 else gravity_down
		velocity.y = minf(velocity.y + g * delta, max_fall_speed)

	# Movimiento horizontal con aceleración y frenada
	var direction := Input.get_axis("ui_left", "ui_right")
	var accel := acceleration if on_floor else air_acceleration
	var fric := friction if on_floor else air_friction
	if direction != 0.0:
		velocity.x = move_toward(velocity.x, direction * max_speed, accel * delta)
	else:
		velocity.x = move_toward(velocity.x, 0.0, fric * delta)

	# Salto (con margen al borde y salto adelantado)
	if _buffer_timer > 0.0 and _coyote_timer > 0.0:
		velocity.y = jump_velocity
		_buffer_timer = 0.0
		_coyote_timer = 0.0

	# Salto de altura variable: soltar el botón subiendo lo recorta
	if Input.is_action_just_released("ui_accept") and velocity.y < 0.0:
		velocity.y *= jump_cut_multiplier

	move_and_slide()
