import 'package:flutter/cupertino.dart';

const acento = Color(0xFF006D65);
const tinta = Color(0xFF102C2C);
const tenue = Color(0xFF4F6266);
const fondo = Color(0xFFF1F5F4);
const linea = Color(0xFFD9E5E2);
const menta = Color(0xFFC9F5E0);
const blanco = CupertinoColors.white;

const normal = TextStyle(fontFamily: 'OrbitRoboto', color: tinta, fontSize: 16);
const chico = TextStyle(color: tenue, fontSize: 13, height: 1.4);
const tituloGrande = TextStyle(
  color: tinta,
  fontSize: 34,
  height: 1.08,
  letterSpacing: -1.25,
  fontWeight: FontWeight.w700,
);

// El tema se hereda en las cinco rutas. Se fija el modo claro para la entrega.
const temaOrbit = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: acento,
  primaryContrastingColor: blanco,
  scaffoldBackgroundColor: fondo,
  barBackgroundColor: fondo,
  textTheme: CupertinoTextThemeData(
    textStyle: normal,
    actionTextStyle: TextStyle(
      fontFamily: 'OrbitRoboto',
      color: acento,
      fontSize: 16,
    ),
    navTitleTextStyle: TextStyle(
      fontFamily: 'OrbitRoboto',
      color: tinta,
      fontSize: 17,
      fontWeight: FontWeight.w700,
    ),
    navActionTextStyle: TextStyle(
      fontFamily: 'OrbitRoboto',
      color: acento,
      fontSize: 16,
    ),
  ),
);
