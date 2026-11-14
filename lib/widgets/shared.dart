import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';

class Pagina extends StatelessWidget {
  const Pagina({
    super.key,
    required this.child,
    this.titulo,
    this.trailing,
    this.volver = true,
  });
  final Widget child;
  final String? titulo;
  final Widget? trailing;
  final bool volver;

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
    navigationBar: titulo == null
        ? null
        : CupertinoNavigationBar(
            middle: Text(titulo!),
            leading: volver && (ModalRoute.of(context)?.canPop ?? false)
                ? CupertinoNavigationBarBackButton(
                    previousPageTitle: 'Volver',
                    onPressed: () => Navigator.maybePop(context),
                  )
                : null,
            automaticallyImplyLeading: false,
            trailing: trailing,
            border: const Border(bottom: BorderSide(color: linea)),
          ),
    // SafeArea conserva el espacio de la barra y del sistema; el ancho se
    // limita para que la interfaz siga siendo legible en web.
    child: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 660),
          child: SizedBox(width: double.infinity, child: child),
        ),
      ),
    ),
  );
}

class Cabecera extends StatelessWidget {
  const Cabecera(this.etiqueta, this.titulo, this.descripcion, {super.key});
  final String etiqueta, titulo, descripcion;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        etiqueta,
        style: const TextStyle(
          color: acento,
          fontSize: 11,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(height: 9),
      Text(titulo, style: tituloGrande),
      const SizedBox(height: 8),
      Text(descripcion, style: chico),
    ],
  );
}

// Cupertino no ofrece un widget llamado Card. Esta composición conserva
// la idea de tarjeta sin introducir Material.
class TarjetaOrbit extends StatelessWidget {
  const TarjetaOrbit({
    super.key,
    required this.child,
    this.color = blanco,
    this.padding = const EdgeInsets.all(18),
  });
  final Widget child;
  final Color color;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(19),
    child: ColoredBox(
      color: color,
      child: Padding(padding: padding, child: child),
    ),
  );
}

class Sello extends StatelessWidget {
  const Sello(this.icono, {super.key, this.color = menta, this.size = 37});
  final IconData icono;
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(size * .27),
    ),
    child: Icon(icono, color: tinta, size: size * .48),
  );
}

class BotonPrincipal extends StatelessWidget {
  const BotonPrincipal(this.texto, {super.key, required this.onPressed});
  final String texto;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: CupertinoButton.filled(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      borderRadius: BorderRadius.circular(13),
      onPressed: onPressed,
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: 'OrbitRoboto',
          color: blanco,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    ),
  );
}

Future<void> aviso(BuildContext context, String titulo, String detalle) =>
    showCupertinoDialog<void>(
      context: context,
      builder: (dialogContext) => CupertinoAlertDialog(
        title: Text(titulo, style: const TextStyle(fontFamily: 'OrbitRoboto')),
        content: Text(
          detalle,
          style: const TextStyle(fontFamily: 'OrbitRoboto'),
        ),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text(
              'Entendido',
              style: TextStyle(fontFamily: 'OrbitRoboto'),
            ),
          ),
        ],
      ),
    );
