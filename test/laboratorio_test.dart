import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:orbit_cupertino/app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    // Las capturas cargan los mismos recursos que la app para evitar
    // fuentes de prueba y glifos vacíos.
    await (FontLoader('OrbitRoboto')
          ..addFont(rootBundle.load('assets/fonts/roboto-regular.ttf'))
          ..addFont(rootBundle.load('assets/fonts/roboto-bold.ttf')))
        .load();
    await (FontLoader('packages/cupertino_icons/CupertinoIcons')..addFont(
          rootBundle.load('packages/cupertino_icons/assets/CupertinoIcons.ttf'),
        ))
        .load();
  });

  Future<void> iniciar(
    WidgetTester tester, {
    Size size = const Size(390, 844),
  }) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = size;
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);
    await tester.pumpWidget(const OrbitApp());
    await tester.pumpAndSettle();
  }

  Future<void> pulsar(WidgetTester tester, Finder finder) async {
    await tester.ensureVisible(finder);
    await tester.pumpAndSettle();
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> volver(WidgetTester tester) =>
      pulsar(tester, find.byType(CupertinoNavigationBarBackButton));

  Future<void> captura(String archivo) => expectLater(
    find.byType(OrbitApp),
    matchesGoldenFile('../docs/capturas/$archivo.png'),
  );

  testWidgets('Las cinco pantallas y el registro visual con capturas', (
    tester,
  ) async {
    await iniciar(tester);
    expect(find.byType(CupertinoApp), findsOneWidget);
    expect(find.byType(CupertinoTextField), findsNWidgets(2));
    await captura('01-acceso');
    await pulsar(tester, find.text('Ingresar al panel'));
    await captura('02-panel');
    expect(find.byType(CupertinoListTile), findsNWidgets(3));
    await pulsar(tester, find.text('Listar productos'));
    expect(find.text('4 productos'), findsOneWidget);
    await captura('03-catalogo');
    await pulsar(tester, find.bySemanticsLabel('Registrar producto'));
    expect(find.byType(CupertinoTextFormFieldRow), findsNWidgets(4));
    await captura('04-registro');
    await pulsar(tester, find.text('Guardar producto'));
    expect(find.byType(CupertinoAlertDialog), findsOneWidget);
    expect(
      find.text('Este formulario no crea ni almacena productos.'),
      findsOneWidget,
    );
    await captura('07-aviso');
    await pulsar(tester, find.text('Entendido'));
    await volver(tester);
    expect(find.text('4 productos'), findsOneWidget);
    await volver(tester);
    await pulsar(tester, find.text('Mi perfil'));
    expect(find.text('Gabriel Haro'), findsNWidgets(2));
    await captura('05-perfil');
    await pulsar(tester, find.text('Editar perfil'));
    expect(
      find.text('Los datos son de solo lectura en este laboratorio.'),
      findsOneWidget,
    );
    await pulsar(tester, find.text('Entendido'));
    await volver(tester);
    await pulsar(tester, find.text('Cerrar sesión'));
    expect(find.text('Iniciar sesión'), findsOneWidget);
    expect(find.byType(CupertinoNavigationBarBackButton), findsNothing);
  });

  testWidgets('Filtro, búsqueda, ficha y estado vacío', (tester) async {
    await iniciar(tester);
    await pulsar(tester, find.text('Ingresar al panel'));
    await pulsar(tester, find.text('Listar productos'));
    await pulsar(tester, find.text('Accesorios'));
    expect(find.text('2 productos'), findsOneWidget);
    expect(find.text('Laptop Pro 14'), findsNothing);
    final campo = find.descendant(
      of: find.byKey(const Key('buscar')),
      matching: find.byType(EditableText),
    );
    await tester.enterText(campo, 'mouse');
    await tester.pumpAndSettle();
    expect(find.text('1 producto'), findsOneWidget);
    await captura('06-busqueda');
    await pulsar(tester, find.text('Mouse inalámbrico'));
    expect(find.byType(CupertinoActionSheet), findsOneWidget);
    await pulsar(tester, find.text('Cerrar ficha'));
    expect(find.text('1 producto'), findsOneWidget);
    await tester.enterText(campo, 'sin coincidencia');
    await tester.pumpAndSettle();
    expect(find.text('Sin resultados'), findsOneWidget);
  });

  testWidgets('La contraseña se puede mostrar y volver a ocultar', (
    tester,
  ) async {
    await iniciar(tester);
    final campo = find.byKey(const Key('clave'));
    expect(tester.widget<CupertinoTextField>(campo).obscureText, isTrue);
    await pulsar(tester, find.bySemanticsLabel('Mostrar contraseña'));
    expect(tester.widget<CupertinoTextField>(campo).obscureText, isFalse);
    await pulsar(tester, find.bySemanticsLabel('Ocultar contraseña'));
    expect(tester.widget<CupertinoTextField>(campo).obscureText, isTrue);
  });

  for (final size in [const Size(320, 640), const Size(1440, 900)]) {
    testWidgets('Navegación sin desbordamientos a $size', (tester) async {
      await iniciar(tester, size: size);
      await pulsar(tester, find.text('Ingresar al panel'));
      await pulsar(tester, find.text('Listar productos'));
      await pulsar(tester, find.bySemanticsLabel('Registrar producto'));
      await pulsar(tester, find.text('Guardar producto'));
      await pulsar(tester, find.text('Entendido'));
      await volver(tester);
      await volver(tester);
      await pulsar(tester, find.text('Mi perfil'));
      await pulsar(tester, find.text('Editar perfil'));
      await pulsar(tester, find.text('Entendido'));
      expect(tester.takeException(), isNull);
    });
  }
}
