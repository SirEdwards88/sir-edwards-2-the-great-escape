# Fase: acciones move_up y move_down

## Objetivo
Completar las acciones de movimiento de `CLAUDE.md` en el Input Map. Todavía no se usan: no hay mecánica de movimiento vertical.

## Alcance
- `project.godot`: dos acciones nuevas en `[input]`, con zona muerta de 0,2 y teclas físicas.
  - `move_up`: W y flecha arriba.
  - `move_down`: S y flecha abajo.
- La flecha arriba ya es también `jump`. Godot permite la misma tecla en dos acciones y, mientras `move_up` no se use, no hay efecto.

## Fuera de alcance
- Usar las acciones en `player.gd`, la resolución, la escena, las físicas y los controles existentes.
- Botones y sticks del mando.

## Decisión abierta
Edu no sabe aún si el juego será «2,5D», con movimiento hacia arriba y abajo, o solo izquierda, derecha y salto. Hasta decidirlo, `move_up` y `move_down` quedan definidas pero sin función.

## Lista de comprobación
- [x] `move_up` y `move_down` definidas con las teclas indicadas (comprobación estática).
- [ ] Probado en Godot 4.7: el juego arranca, el jugador se mueve y salta como antes y W y S no hacen nada visible.
- [ ] En «Proyecto > Ajustes del proyecto > Mapa de entrada» aparecen `move_up` y `move_down`.
- [ ] Visto bueno de Edu, commit y push a `main`.
