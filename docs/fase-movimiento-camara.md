# Fase: movimiento básico con cámara (escala 180 px)

## Objetivo
Confirmar que el movimiento básico funciona con cámara a 180 px y añadir el reinicio manual mínimo a las escenas de prueba. Escala 180 px: decisión provisional de Edu (ver `docs/fase-escala.md`).

## Ya comprobado por Edu
- En `scale_test_180.tscn` la escala se siente y se ve mejor que 120 y 240.
- Reinicio al caer al vacío y cámara: funcionan bien («perfecto»).

## Alcance
- `project.godot`: acción `restart` con la tecla R (teclado).
- `scripts/restart_on_input.gd` (nuevo): recarga la escena al pulsar `restart`. Se añade a la raíz de `scale_test_120/180/240.tscn`.

## Fuera de alcance
Límites definitivos de cámara, botón de mando para `restart` (pendiente de decidir la asignación del mando), puntos de control, dash y demás mecánicas, limpieza de GLIDE, cambio de la escena principal del proyecto.

## Cómo probarlo
1. Abre `scenes/levels/scale_test_180.tscn` y pulsa F6.
2. Avanza un poco, salta y pulsa R: la escena debe reiniciarse y el jugador volver al inicio.
3. Comprueba que correr, saltar y la caída al vacío siguen igual.

## Lista de comprobación
- [x] `restart` definida y script asignado a las tres escenas (comprobación estática).
- [x] Probado en Godot 4.7 (Edu): R reinicia la escena de prueba.
- [ ] Probado: el resto del movimiento y la cámara siguen igual.
- [ ] Visto bueno de Edu, commit y push a `main`.
