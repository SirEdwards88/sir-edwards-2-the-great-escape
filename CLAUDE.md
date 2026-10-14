# SirEdwards 2: The Great Escape — reglas de trabajo del proyecto

Juego de plataformas 2D para PC (teclado y mando) con Sir Edwards, hecho en Godot 4 con GDScript.
El Quiz y el runner de Phaser son proyectos aparte: no se tocan desde aquí.

## Idioma y estilo
- Respuestas, comentarios y textos del juego en español, de «tú», sin emojis y con comillas «».
- Identificadores de código (variables, funciones, nodos, escenas) en inglés, como manda Godot.
- Sé económico: no expliques lo obvio, no pegues archivos enteros en la respuesta y resume lo hecho en pocas líneas.

## Producto (decisiones cerradas)
- Sir Edwards: elegante, sarcástico, con mucha clase y poca paciencia. Sus frases son un rasgo central del juego.
- Las frases viven en un archivo de datos (`data/phrases.json`), por categorías (salto, caída, muerte, victoria, coleccionable, etc.), nunca escritas dentro de los scripts.
  Las escribe o revisa Edu; no inventes frases definitivas, propón borradores marcados como tales.
- El arte lo genera Edu (pintado, alta resolución). No crees arte nuevo ni lo sustituyas. Los marcadores de posición («placeholders») van claramente marcados y sin pretensión de arte final.
- Primero PC con teclado y mando. Android u otras plataformas quedan fuera hasta nuevo aviso.

## Tecnología
- Godot 4.x estable (versión estándar, sin .NET). GDScript con tipos estáticos siempre que se pueda.
- Sin addons ni dependencias salvo que sean imprescindibles. Si hace falta un marco de pruebas (GUT o gdUnit4), pregunta antes.
- Resolución base 1920x1080, `stretch mode: canvas_items`, aspecto `keep`.
- Texturas pintadas de alta resolución: filtro lineal con mipmaps, nada de «pixel art» ni `nearest`.
- Mapas de nivel con `TileMapLayer`.

## Arquitectura
Carpetas: `scenes/` (player, levels, enemies, ui), `scripts/`, `assets/` (sprites, audio, fonts), `data/`, `autoload/`, `docs/`, `tests/`.
- Escenas pequeñas y reutilizables, un script por responsabilidad y señales en vez de referencias directas entre nodos.
- Los autoloads son pocos y solo para estado global (`GameState`, `Phrases`, `AudioBus`). Sin lógica de juego dentro de ellos.
- Todos los valores de tacto del movimiento (aceleración, fricción, gravedad, fuerza de salto, tiempos de margen) viven en un recurso `PlayerTuning` editable desde el inspector. Nada de números mágicos en el código.
- Entrada solo mediante el Input Map (`move_left`, `move_right`, `move_up`, `move_down`, `jump`, `restart`; `dash` queda reservada para más adelante). Nunca leas teclas ni botones concretos: tiene que valer igual con teclado y con mando, con zona muerta en los sticks.
- La física va en `_physics_process` y usa `delta`.
- Lo nuevo va en su propio script o escena; no inflar los existentes.

## Cómo se trabaja
- Por fases con alcance cerrado. Cada fase tiene su especificación en `docs/` con una lista de «hecho». No empieces la siguiente sin el visto bueno de Edu.
- No mezcles refactors con cambios funcionales ajenos a la tarea.
- El tacto del movimiento lo decide Edu jugando. Cambia una sola cosa cada vez, di qué valor has tocado y qué debería notarse, y pídele que pruebe.
- Antes de dar algo por hecho, comprueba que el proyecto abre sin errores: `godot --headless --path . --quit` (o el equivalente con la ruta de Godot anotada en `docs/entorno.md`; si no está, pregúntala una vez y anótala).
- Di siempre qué debe probar Edu a mano y cómo (qué escena abrir, qué tecla pulsar).

## Datos y guardado
- Los guardados van en `user://`, con un número de versión en el formato. Nunca pierdas datos de partidas existentes: si el formato cambia, migra.

## Git
- Commits pequeños y en español. Rama principal `main`.
- Haz tú los commits y los push cuando una tarea esté comprobada; deja a Edu el mínimo trabajo manual.
- No subas `.godot/`, carpetas de exportación (`builds/`), claves ni credenciales.
- No sobrescribas archivos de Edu (arte, audio, `data/phrases.json`) sin avisar.
