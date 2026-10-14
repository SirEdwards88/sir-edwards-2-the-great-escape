# Fase: prueba de escala (120, 180 y 240 px)

## Objetivo
Comparar tres alturas del personaje provisional con las mismas condiciones de juego, para elegir la escala visual antes de pintar arte definitivo. Es una hipótesis de partida (180 px), no una decisión.

## Alcance
- `scenes/levels/scale_test_120.tscn`, `scale_test_180.tscn` y `scale_test_240.tscn`: mismo nivel en «unidades de personaje» (la unidad es la altura del personaje), con huecos de 1,5, 3 y 4 unidades, escalones de 1 y 1,8 unidades, suelo largo, muros en los extremos y `Camera2D` hija del jugador con suavizado y zoom 1.
- `data/tuning/player_tuning_120.tres`, `_180.tres` y `_240.tres`: copia de los valores base con velocidades, aceleraciones, rozamientos, gravedades y velocidad de salto multiplicados por k = altura / 48. Los tiempos (margen al borde, salto adelantado) y el recorte del salto no cambian.
- La colisión (cápsula) y el dibujo provisional del jugador se escalan por k cambiando sus formas, no el nodo `CharacterBody2D`.
- `scripts/kill_zone.gd`: al caer al vacío se recarga la escena. Sin puntos de control.

## Fuera de alcance
`player.gd`, `project.godot`, `Main.tscn`, resolución, dash, doble salto, salto en pared, límites definitivos de cámara, acción `restart` y limpieza de GLIDE.

## Valores provisionales (decidir jugando)
- Cámara: `offset` de (0, -216) para ver más por encima del jugador, suavizado a velocidad 5, sin límites.
- Distancias del nivel: son una propuesta; la altura de salto pleno calculada es de unas 2,2 unidades y su alcance de unas 4,2.

## Cómo probarlo
1. En Godot, abre `scenes/levels/scale_test_180.tscn` y pulsa F6. Repite con 120 y 240.
2. Mueve, salta, cruza los huecos y sube los escalones. Cae al vacío: debe reiniciarse la escena.
3. Para cada escala anota: ¿se reconoce al personaje?, ¿ves venir los huecos?, ¿se siente igual el salto?, ¿molesta la cámara?

## Lista de comprobación
- [x] Las tres escalas usan los mismos valores en unidades de personaje (comprobación estática).
- [ ] Probado en Godot 4.7: las tres escenas abren sin errores.
- [ ] Probado: el personaje se mueve y salta; el tacto es parecido en las tres escalas.
- [ ] Probado: caer al vacío reinicia la escena.
- [x] Edu elige escala: 180 px (según Edu, es donde mejor se siente y mejor se ve el suelo). Decisión provisional, revisable al probar dash, doble salto y salto en pared.
- [ ] Visto bueno de Edu, commit y push a `main`.
