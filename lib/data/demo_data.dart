import 'package:flutter/cupertino.dart';

// Una lista conserva el orden del catálogo. Los mapas agrupan atributos
// con tipos distintos. Todo es constante y local.
const List<Map<String, Object>> productos = [
  {
    'nombre': 'Laptop Pro 14',
    'categoria': 'Computación',
    'precio': 3500.0,
    'stock': 10,
    'icono': CupertinoIcons.device_laptop,
    'color': Color(0xFFD9F2E8),
  },
  {
    'nombre': 'Mouse inalámbrico',
    'categoria': 'Accesorios',
    'precio': 50.0,
    'stock': 25,
    'icono': CupertinoIcons.cursor_rays,
    'color': Color(0xFFECE8FF),
  },
  {
    'nombre': 'Teclado mecánico',
    'categoria': 'Accesorios',
    'precio': 120.0,
    'stock': 15,
    'icono': CupertinoIcons.keyboard,
    'color': Color(0xFFFFEDDB),
  },
  {
    'nombre': 'Monitor Studio 27',
    'categoria': 'Computación',
    'precio': 800.0,
    'stock': 8,
    'icono': CupertinoIcons.desktopcomputer,
    'color': Color(0xFFE1ECFC),
  },
];

const Map<String, String> perfil = {
  'Nombre': 'Gabriel Haro',
  'Correo': 'gabriel.haro@tecsup.edu.pe',
  'Teléfono': 'Sin especificar',
  'Rol': 'Administrador',
};

String precioDe(Map<String, Object> p) =>
    'S/ ${(p['precio'] as double).toStringAsFixed(2)}';
