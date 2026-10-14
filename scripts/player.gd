extends CharacterBody2D

signal state_changed(previous: PlayerState.State, current: PlayerState.State)

@export var tuning: PlayerTuning = preload("res://data/player_tuning.tres")

var state := PlayerState.State.RUN
var _coyote_timer := 0.0
var _buffer_timer := 0.0

func _ready() -> void:
	if tuning == null:
		push_error("Player: falta asignar el recurso PlayerTuning (data/player_tuning.tres).")
		set_physics_process(false)

func _physics_process(delta: float) -> void:
	var on_floor := is_on_floor()

	# Márgenes de tiempo
	if on_floor:
		_coyote_timer = tuning.coyote_time
	else:
		_coyote_timer = maxf(_coyote_timer - delta, 0.0)
	if Input.is_action_just_pressed("jump"):
		_buffer_timer = tuning.jump_buffer_time
	else:
		_buffer_timer = maxf(_buffer_timer - delta, 0.0)

	# Gravedad (más fuerte al caer)
	if not on_floor:
		var g := tuning.gravity_up if velocity.y < 0.0 else tuning.gravity_down
		velocity.y = minf(velocity.y + g * delta, tuning.max_fall_speed)

	# Movimiento horizontal con aceleración y frenada
	var direction := Input.get_axis("move_left", "move_right")
	var accel := tuning.acceleration if on_floor else tuning.air_acceleration
	var fric := tuning.friction if on_floor else tuning.air_friction
	if direction != 0.0:
		velocity.x = move_toward(velocity.x, direction * tuning.max_speed, accel * delta)
	else:
		velocity.x = move_toward(velocity.x, 0.0, fric * delta)

	# Salto (con margen al borde y salto adelantado)
	if _buffer_timer > 0.0 and _coyote_timer > 0.0:
		velocity.y = tuning.jump_velocity
		_buffer_timer = 0.0
		_coyote_timer = 0.0

	# Salto de altura variable: soltar el botón subiendo lo recorta
	if Input.is_action_just_released("jump") and velocity.y < 0.0:
		velocity.y *= tuning.jump_cut_multiplier

	move_and_slide()
	_update_state()

func _update_state() -> void:
	var new_state := PlayerState.from_motion(is_on_floor(), velocity.y)
	if new_state != state:
		var previous := state
		state = new_state
		state_changed.emit(previous, new_state)
