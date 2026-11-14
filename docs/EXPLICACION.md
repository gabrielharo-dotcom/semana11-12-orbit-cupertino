# Desarrollo del laboratorio Cupertino

**Autor: Gabriel Haro** · Aplicaciones Multiplataformas · Semanas 11–12

El laboratorio desarrolla un catálogo de productos en Dart y Flutter. Su objetivo es practicar la navegación, el tema global y los controles Cupertino. Los cuatro productos y el perfil se leen de datos locales.

- **Rutas.** `app.dart` asocia nombres con pantallas. `pushReplacementNamed` sustituye el acceso por el panel; `pushNamed` permite abrir una vista y volver. Al cerrar sesión, `pushNamedAndRemoveUntil` limpia el historial para que el botón Atrás no vuelva al panel.
- **Componentes compartidos.** `Pagina` aplica la estructura común de Cupertino y limita el ancho en escritorio. `TarjetaOrbit` construye una superficie redondeada sin usar el widget Material `Card`. `BotonPrincipal` reutiliza un botón relleno de Cupertino.
- **Listas y mapas.** `demo_data.dart` usa una lista de mapas con productos y un mapa de perfil. El menú convierte la lista de opciones en filas con `map`; el perfil usa `entries` para generar sus filas. Se convierten explícitamente los valores tipados como `Object`.
- **Filtrado.** El catálogo usa `setState` para conservar la consulta y la categoría. `where` combina las dos condiciones y deja intacta la lista base. `ListView.separated` genera las tarjetas y un estado vacío si no hay coincidencias.
- **Campos y avisos.** Las filas del registro solo mantienen el texto temporal del campo. Guardar cierra el teclado y presenta un `CupertinoAlertDialog`; no valida para persistir, no llama a una API y no añade un registro. La ficha del catálogo usa `showCupertinoModalPopup` con `CupertinoActionSheet`.
- **Tema.** `CupertinoThemeData` aplica la paleta clara, el color de acción y la fuente local. Los iconos provienen de `cupertino_icons`. Los widgets de estructura y desplazamiento son los widgets comunes de Flutter.
- **Pruebas y evidencias.** Se navega por la aplicación real en las pruebas de widgets, que comparan siete capturas de las pantallas y de dos interacciones. Las fuentes de las capturas son las mismas que en la app.

## Para exponer

Empieza por el mapa de rutas y el tema. Muestra la navegación, el filtro combinado y el aviso del formulario. Termina explicando que el catálogo usa una lista de mapas y que Cupertino ofrece filas agrupadas, mientras las tarjetas se construyen por composición.
