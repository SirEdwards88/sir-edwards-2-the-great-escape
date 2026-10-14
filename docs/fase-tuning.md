# Fase: recurso PlayerTuning

## Objetivo
Centralizar los parámetros de tacto del movimiento del jugador en un recurso `PlayerTuning`, editable desde el inspector, sin cambiar el comportamiento actual.

## Alcance
- `scripts/player_tuning.gd`: clase `PlayerTuning` (extiende `Resource`) con los 12 parámetros actuales, en los grupos Movimiento, Salto y Gravedad, con sus valores y comentarios originales.
- `data/player_tuning.tres`: instancia del recurso con los 12 valores actuales.
- `scripts/player.gd`: sustituye las 12 exportaciones por `@export var tuning: PlayerTuning` (con el `.tres` como valor por defecto) y lee los valores desde `tuning`.
- Protección mínima: si `tuning` no está asignado, `_ready()` escribe un error en la consola y desactiva `_physics_process`. No usa valores alternativos y no afecta al comportamiento normal.

## Fuera de alcance
- Resolución, escena (`Main.tscn`), `project.godot` y Input Map.
- Estados `RUN`, `JUMP`, `FALL`, `CRASH` y `VICTORY`.
- Cualquier mecánica, nivel, arte o animación nuevos.
- Cambios de velocidades, físicas o controles. Los valores son los de antes.

## Valores (sin cambios respecto a antes de esta fase)
- Movimiento: `max_speed` 300, `acceleration` 2200, `friction` 2600, `air_acceleration` 1600, `air_friction` 700.
- Salto: `jump_velocity` -560, `jump_cut_multiplier` 0,45, `coyote_time` 0,10, `jump_buffer_time` 0,12.
- Gravedad: `gravity_up` 1500, `gravity_down` 2300, `max_fall_speed` 1100.

## Lista de comprobación
Hecho (comprobación estática, sin Godot):
- [x] Los 12 parámetros, tipos, valores y comentarios del recurso coinciden con los originales.
- [x] La lógica de `_physics_process` es idéntica salvo el prefijo `tuning.` en los 12 usos.

Probado por Edu en Godot 4.7:
- [x] El juego arranca y el recurso se carga (el jugador se mueve, así que `tuning` está asignado).
- [x] Movimiento a izquierda y derecha y choque con los bordes, igual que antes.
- [x] Salto corto (soltando pronto) y salto largo (manteniendo), igual que antes.

Sin probar (queda pendiente para cuando se pueda):
- [ ] `Player` en `Main.tscn` muestra el campo `Tuning` apuntando a `data/player_tuning.tres` con los valores de arriba.
- [ ] Al vaciar el campo `Tuning`, la consola muestra el error y el jugador no se mueve, sin bloqueos.
- [ ] El margen al borde (`coyote_time`) y el salto adelantado (`jump_buffer_time`) se sienten igual. Los valores y la lógica no han cambiado.
- [ ] Aceleración y frenada, en suelo y en el aire, se sienten igual que antes.

Cierre de la fase:
- [x] `scripts/player_tuning.gd.uid`, creado por Godot, incluido en el repositorio.
- [x] El `.tres` de la copia local es idéntico al del repositorio (Godot no lo reescribió).
- [x] Visto bueno de Edu para publicar, con lo anterior sin probar.
