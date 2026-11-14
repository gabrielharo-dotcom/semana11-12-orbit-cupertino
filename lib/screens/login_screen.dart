import 'package:flutter/cupertino.dart';
import '../app.dart';
import '../theme/app_theme.dart';
import '../widgets/shared.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool ocultar = true;

  @override
  Widget build(BuildContext context) => Pagina(
    child: ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 28),
      children: [
        const Row(
          children: [
            Sello(CupertinoIcons.circle_grid_3x3_fill),
            SizedBox(width: 10),
            Text(
              'Orbit',
              style: TextStyle(
                fontSize: 24,
                color: tinta,
                fontWeight: FontWeight.w700,
                letterSpacing: -.8,
              ),
            ),
            Spacer(),
            Text(
              'EDICIÓN CUPERTINO',
              style: TextStyle(
                color: acento,
                letterSpacing: 1.2,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const TarjetaOrbit(
          color: tinta,
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'LABORATORIO 09',
                    style: TextStyle(
                      color: menta,
                      letterSpacing: 1.8,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Icon(CupertinoIcons.sparkles, color: menta, size: 24),
                ],
              ),
              SizedBox(height: 23),
              Text(
                'Tu catálogo\nen órbita.',
                style: TextStyle(
                  color: blanco,
                  fontSize: 40,
                  height: 1.03,
                  letterSpacing: -1.3,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Un espacio de muestra para explorar productos y practicar navegación.',
                style: TextStyle(color: menta, height: 1.4, fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        const Cabecera(
          'PUNTO DE ENTRADA',
          'Iniciar sesión',
          'Puedes entrar sin credenciales.',
        ),
        const SizedBox(height: 17),
        const CupertinoTextField(
          key: Key('correo'),
          placeholder: 'Correo electrónico',
          padding: EdgeInsets.all(15),
          keyboardType: TextInputType.emailAddress,
          prefix: Padding(
            padding: EdgeInsets.only(left: 13),
            child: Icon(CupertinoIcons.mail, size: 20, color: acento),
          ),
        ),
        const SizedBox(height: 10),
        CupertinoTextField(
          key: const Key('clave'),
          placeholder: 'Contraseña',
          padding: const EdgeInsets.all(15),
          obscureText: ocultar,
          autocorrect: false,
          enableSuggestions: false,
          prefix: const Padding(
            padding: EdgeInsets.only(left: 13),
            child: Icon(CupertinoIcons.lock, size: 20, color: acento),
          ),
          suffix: CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            onPressed: () => setState(() => ocultar = !ocultar),
            child: Semantics(
              label: ocultar ? 'Mostrar contraseña' : 'Ocultar contraseña',
              child: Icon(
                ocultar ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                size: 20,
              ),
            ),
          ),
        ),
        const SizedBox(height: 17),
        BotonPrincipal(
          'Ingresar al panel',
          onPressed: () {
            Navigator.pushReplacementNamed(context, Rutas.panel);
          },
        ),
        CupertinoButton(
          onPressed: () => aviso(
            context,
            'Acceso de práctica',
            'Puedes entrar sin usuario ni contraseña.',
          ),
          child: const Text('¿Olvidaste tu contraseña?'),
        ),
        const Center(
          child: Text(
            'Gabriel Haro · Aplicaciones Multiplataformas',
            style: chico,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
