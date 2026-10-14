# Fase: estados del jugador (B1)

## Objetivo
Declarar los estados RUN, JUMP, FALL, GLIDE, CRASH y VICTORY y detectar los tres que salen del movimiento actual, sin cambiar el comportamiento del jugador.

## Definiciones acordadas con Edu
- `RUN`: en el suelo. Por ahora cubre también estar parado, porque no hay estado de reposo.
- `JUMP`: en el aire, subiendo.
- `FALL`: en el aire, cayendo. La caída al vacío como evento de juego es otra cosa y se definirá aparte.
- `GLIDE`: planear. Se activará manteniendo Shift mientras se cae.
- `CRASH`: chocar contra un enemigo o un obstáculo.
- `VICTORY`: llegar al final del nivel.

## Alcance de esta fase (B1)
- `scripts/player_state.gd`: clase `PlayerState` con el `enum State` y la función `from_motion(on_floor, vertical_velocity)`, que devuelve RUN, JUMP o FALL.
- `scripts/player.gd`: señal `state_changed(previous, current)`, variable `state` y una función `_update_state()`, llamada tras `move_and_slide()`. Solo informa del estado: no modifica velocidades ni colisiones.
- GLIDE, CRASH y VICTORY están declarados pero no se activan.

## Fuera de alcance
- La mecánica de planeo (fase B2), que necesitará un valor nuevo en `PlayerTuning`, decidido por Edu jugando.
- Choques con enemigos u obstáculos y llegada al final del nivel (fase B3), que necesitan elementos nuevos en la escena.
- Resolución, escena, físicas, controles y valores de `PlayerTuning`.

## Lista de comprobación
- [x] La lógica de movimiento de `_physics_process` no cambia; solo se añade `_update_state()` al final (comprobación estática).
- [ ] Probado en Godot 4.7: el juego arranca y el movimiento y el salto se sienten igual que antes.
- [ ] Los estados no se ven en pantalla; se comprobarán con la fase B2, cuando GLIDE los use.
- [ ] Traer el `scripts/player_state.gd.uid` que crea Godot.
- [ ] Visto bueno de Edu, commit y push a `main`.
