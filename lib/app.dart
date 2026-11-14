import 'package:flutter/cupertino.dart';

import 'screens/login_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/products_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/register_screen.dart';
import 'theme/app_theme.dart';

abstract final class Rutas {
  static const acceso = '/';
  static const panel = '/menu';
  static const productos = '/productos';
  static const registro = '/registro';
  static const perfil = '/perfil';
}

class OrbitApp extends StatelessWidget {
  const OrbitApp({super.key});

  @override
  Widget build(BuildContext context) => CupertinoApp(
    title: 'Orbit · Cupertino',
    debugShowCheckedModeBanner: false,
    theme: temaOrbit,
    // CupertinoApp genera las rutas con el comportamiento de navegación iOS.
    routes: {
      Rutas.acceso: (_) => const LoginScreen(),
      Rutas.panel: (_) => const MenuScreen(),
      Rutas.productos: (_) => const ProductsScreen(),
      Rutas.registro: (_) => const RegisterScreen(),
      Rutas.perfil: (_) => const ProfileScreen(),
    },
  );
}
