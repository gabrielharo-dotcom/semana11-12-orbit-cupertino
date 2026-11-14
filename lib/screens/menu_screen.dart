import 'package:flutter/cupertino.dart';
import '../app.dart';
import '../data/demo_data.dart';
import '../theme/app_theme.dart';
import '../widgets/shared.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  static const opciones = <Map<String, Object>>[
    {
      'titulo': 'Listar productos',
      'subtitulo': 'Busca y filtra el catálogo',
      'icono': CupertinoIcons.square_grid_2x2,
      'ruta': Rutas.productos,
      'color': menta,
    },
    {
      'titulo': 'Registrar producto',
      'subtitulo': 'Explora el formulario visual',
      'icono': CupertinoIcons.plus_app,
      'ruta': Rutas.registro,
      'color': Color(0xFFFFEDDB),
    },
    {
      'titulo': 'Mi perfil',
      'subtitulo': 'Consulta los datos del estudiante',
      'icono': CupertinoIcons.person_crop_circle,
      'ruta': Rutas.perfil,
      'color': Color(0xFFECE8FF),
    },
  ];

  @override
  Widget build(BuildContext context) => Pagina(
    titulo: 'Orbit',
    volver: false,
    trailing: CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => Navigator.pushNamed(context, Rutas.perfil),
      child: const Icon(
        CupertinoIcons.person_crop_circle,
        semanticLabel: 'Abrir perfil',
      ),
    ),
    child: ListView(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 22),
      children: [
        const Cabecera(
          'PANEL PRINCIPAL',
          'Hola, Gabriel',
          'Elige qué quieres explorar hoy.',
        ),
        const SizedBox(height: 19),
        TarjetaOrbit(
          color: tinta,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(CupertinoIcons.cube_box, color: menta, size: 21),
                  SizedBox(width: 8),
                  Text(
                    'ORBIT / CATÁLOGO',
                    style: TextStyle(
                      color: menta,
                      letterSpacing: 1.5,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 17),
              Text(
                '${productos.length} productos de muestra',
                style: const TextStyle(
                  color: blanco,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Tecnología y accesorios',
                style: TextStyle(color: menta, fontSize: 13),
              ),
              const SizedBox(height: 12),
              CupertinoButton(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                color: menta,
                borderRadius: BorderRadius.circular(12),
                onPressed: () => Navigator.pushNamed(context, Rutas.productos),
                child: const Text(
                  'Explorar catálogo',
                  style: TextStyle(
                    color: tinta,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 23),
        const Text(
          'Accesos rápidos',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        // map transforma cada fila de datos en una opción navegable.
        CupertinoListSection.insetGrouped(
          margin: EdgeInsets.zero,
          backgroundColor: fondo,
          decoration: BoxDecoration(
            color: blanco,
            borderRadius: BorderRadius.circular(19),
          ),
          children: opciones
              .map(
                (opcion) => CupertinoListTile.notched(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 11,
                  ),
                  leadingSize: 36,
                  leading: Sello(
                    opcion['icono'] as IconData,
                    color: opcion['color'] as Color,
                  ),
                  title: Text(
                    opcion['titulo'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  subtitle: Text(
                    opcion['subtitulo'] as String,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () {
                    Navigator.pushNamed(context, opcion['ruta'] as String);
                  },
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 12),
        CupertinoButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
            context,
            Rutas.acceso,
            (_) => false,
          ),
          child: const Text('Cerrar sesión'),
        ),
      ],
    ),
  );
}
