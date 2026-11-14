import 'package:flutter/cupertino.dart';
import '../theme/app_theme.dart';
import '../widgets/shared.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) => Pagina(
    titulo: 'Registro',
    child: ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.fromLTRB(20, 23, 20, 24),
      children: [
        const Cabecera(
          'FORMULARIO DE PRÁCTICA',
          'Nuevo producto',
          'Conoce cómo se organiza una ficha de inventario.',
        ),
        const SizedBox(height: 17),
        TarjetaOrbit(
          child: Column(
            children: [
              const Sello(CupertinoIcons.photo_on_rectangle, size: 51),
              const SizedBox(height: 5),
              CupertinoButton(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                onPressed: () => aviso(
                  context,
                  'Imagen de muestra',
                  'Este formulario no adjunta archivos.',
                ),
                child: const Text('Añadir imagen'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 17),
        const Text(
          'Información del producto',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 9),
        CupertinoFormSection.insetGrouped(
          margin: EdgeInsets.zero,
          backgroundColor: fondo,
          decoration: BoxDecoration(
            color: blanco,
            borderRadius: BorderRadius.circular(19),
          ),
          children: [
            CupertinoTextFormFieldRow(
              prefix: const _Etiqueta('Nombre'),
              placeholder: 'Ej. Monitor',
              textCapitalization: TextCapitalization.sentences,
            ),
            CupertinoTextFormFieldRow(
              prefix: const _Etiqueta('Descripción'),
              placeholder: 'Características',
              maxLines: 2,
              textCapitalization: TextCapitalization.sentences,
            ),
            CupertinoTextFormFieldRow(
              prefix: const _Etiqueta('Precio'),
              placeholder: 'S/ 0.00',
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            CupertinoTextFormFieldRow(
              prefix: const _Etiqueta('Stock'),
              placeholder: '0',
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        const SizedBox(height: 21),
        BotonPrincipal(
          'Guardar producto',
          onPressed: () {
            FocusScope.of(context).unfocus();
            aviso(
              context,
              'Registro de muestra',
              'Este formulario no crea ni almacena productos.',
            );
          },
        ),
        const SizedBox(height: 10),
        const Text(
          'Formulario visual · Sin almacenamiento',
          textAlign: TextAlign.center,
          style: chico,
        ),
      ],
    ),
  );
}

class _Etiqueta extends StatelessWidget {
  const _Etiqueta(this.texto);
  final String texto;
  @override
  Widget build(BuildContext context) => SizedBox(
    width: 91,
    child: Text(
      texto,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
    ),
  );
}
