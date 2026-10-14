class_name PlayerState
extends RefCounted
## Estados del jugador y la regla que decide el estado a partir del movimiento.
## Solo describe: no mueve al jugador ni cambia la física.

enum State { RUN, JUMP, FALL, CRASH, VICTORY }

## RUN, JUMP y FALL se deducen del movimiento. CRASH y VICTORY
## están declarados pero todavía no se activan.
static func from_motion(on_floor: bool, vertical_velocity: float) -> State:
	if on_floor:
		return State.RUN
	if vertical_velocity < 0.0:
		return State.JUMP
	return State.FALL
