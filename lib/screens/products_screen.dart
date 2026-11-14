import 'package:flutter/cupertino.dart';
import '../app.dart';
import '../data/demo_data.dart';
import '../theme/app_theme.dart';
import '../widgets/shared.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  static const categorias = ['Todos', 'Computación', 'Accesorios'];
  String filtro = categorias.first;
  String consulta = '';

  @override
  Widget build(BuildContext context) {
    // Se combinan categoría y búsqueda. where crea una vista de lectura
    // y toList permite usar el índice en ListView.separated.
    final visibles = productos
        .where(
          (p) =>
              (filtro == categorias.first || p['categoria'] == filtro) &&
              (p['nombre'] as String).toLowerCase().contains(
                consulta.trim().toLowerCase(),
              ),
        )
        .toList();

    return Pagina(
      titulo: 'Productos',
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () => Navigator.pushNamed(context, Rutas.registro),
        child: const Icon(
          CupertinoIcons.add_circled,
          semanticLabel: 'Registrar producto',
        ),
      ),
      child: ListView.separated(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.fromLTRB(20, 23, 20, 24),
        itemCount: 1 + (visibles.isEmpty ? 1 : visibles.length),
        separatorBuilder: (_, _) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Cabecera(
                  'INVENTARIO LOCAL',
                  'Catálogo',
                  'Explora los productos y abre su ficha.',
                ),
                const SizedBox(height: 16),
                CupertinoSearchTextField(
                  key: const Key('buscar'),
                  placeholder: 'Buscar producto',
                  onChanged: (texto) => setState(() => consulta = texto),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoSlidingSegmentedControl<String>(
                    groupValue: filtro,
                    children: {
                      for (final categoria in categorias)
                        categoria: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            categoria,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                    },
                    onValueChanged: (valor) {
                      if (valor != null) setState(() => filtro = valor);
                    },
                  ),
                ),
                const SizedBox(height: 17),
                Text(
                  '${visibles.length} ${visibles.length == 1 ? 'producto' : 'productos'}',
                  style: chico,
                ),
              ],
            );
          }
          if (visibles.isEmpty) {
            return const TarjetaOrbit(
              child: Column(
                children: [
                  Icon(CupertinoIcons.search, color: acento),
                  SizedBox(height: 9),
                  Text(
                    'Sin resultados',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Prueba con otro nombre o categoría.',
                    style: chico,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }
          final p = visibles[index - 1];
          return TarjetaOrbit(
            padding: EdgeInsets.zero,
            child: CupertinoListTile.notched(
              key: ValueKey(p['nombre']),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              leadingSize: 42,
              leadingToTitle: 10,
              leading: Sello(
                p['icono'] as IconData,
                color: p['color'] as Color,
                size: 42,
              ),
              title: Text(
                p['nombre'] as String,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text('${p['stock']} en stock', style: chico),
              additionalInfo: Text(
                precioDe(p),
                style: const TextStyle(
                  color: acento,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
              trailing: const CupertinoListTileChevron(),
              onTap: () {
                _detalle(context, p);
              },
            ),
          );
        },
      ),
    );
  }

  // El panel modal muestra datos de lectura y conserva el filtro al cerrarse.
  Future<void> _detalle(BuildContext context, Map<String, Object> p) =>
      showCupertinoModalPopup<void>(
        context: context,
        builder: (modal) => CupertinoActionSheet(
          title: Text(
            p['nombre'] as String,
            style: const TextStyle(fontFamily: 'OrbitRoboto'),
          ),
          message: Text(
            '${p['categoria']} · ${precioDe(p)} · ${p['stock']} en stock',
            style: const TextStyle(fontFamily: 'OrbitRoboto'),
          ),
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(modal),
            child: const Text(
              'Cerrar ficha',
              style: TextStyle(fontFamily: 'OrbitRoboto'),
            ),
          ),
        ),
      );
}
