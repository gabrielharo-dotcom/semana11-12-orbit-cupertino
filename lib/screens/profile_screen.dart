import 'package:flutter/cupertino.dart';
import '../data/demo_data.dart';
import '../theme/app_theme.dart';
import '../widgets/shared.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const iconos = {
    'Nombre': CupertinoIcons.person,
    'Correo': CupertinoIcons.mail,
    'Teléfono': CupertinoIcons.phone,
    'Rol': CupertinoIcons.checkmark_shield,
  };

  @override
  Widget build(BuildContext context) => Pagina(
    titulo: 'Mi perfil',
    child: ListView(
      padding: const EdgeInsets.fromLTRB(20, 23, 20, 24),
      children: [
        TarjetaOrbit(
          color: tinta,
          padding: const EdgeInsets.all(23),
          child: Column(
            children: [
              const Text(
                'PERFIL DEL ESTUDIANTE',
                style: TextStyle(
                  color: menta,
                  letterSpacing: 1.6,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 17),
              const DecoratedBox(
                decoration: BoxDecoration(color: menta, shape: BoxShape.circle),
                child: SizedBox.square(
                  dimension: 73,
                  child: Center(
                    child: Text(
                      'GH',
                      style: TextStyle(
                        color: tinta,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 13),
              Text(
                perfil['Nombre']!,
                style: const TextStyle(
                  color: blanco,
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Aplicaciones Multiplataformas',
                textAlign: TextAlign.center,
                style: TextStyle(color: menta, fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(height: 21),
        const Text(
          'Información personal',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        CupertinoListSection.insetGrouped(
          margin: EdgeInsets.zero,
          backgroundColor: fondo,
          decoration: BoxDecoration(
            color: blanco,
            borderRadius: BorderRadius.circular(19),
          ),
          children: perfil.entries
              .map(
                (dato) => CupertinoListTile.notched(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  leadingSize: 37,
                  leading: Sello(iconos[dato.key]!),
                  title: Text(
                    dato.key,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  subtitle: Text(
                    dato.value,
                    overflow: TextOverflow.ellipsis,
                    style: chico,
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 17),
        BotonPrincipal(
          'Editar perfil',
          onPressed: () {
            aviso(
              context,
              'Perfil de muestra',
              'Los datos son de solo lectura en este laboratorio.',
            );
          },
        ),
      ],
    ),
  );
}
