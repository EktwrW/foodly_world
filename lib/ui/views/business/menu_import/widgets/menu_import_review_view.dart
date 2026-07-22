import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/data_models/menu_import/menu_import_parse_response_dm.dart';
import 'package:foodly_world/data_transfer_objects/menu_import/menu_import_bulk_dto.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/menu_import/cubit/menu_import_cubit.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;

/// Pantalla 2 del flow "Importar menú con IA" — el manager revisa los
/// items que la IA extrajo, los edita inline (nombre, descripción,
/// precio), elimina los que no quiera, y confirma para hacer el
/// bulk-import al BE.
///
/// **Estructura visual**:
///   - AppBar custom con título "Revisá tu menú" + contador total al trailing.
///   - Por cada categoría raíz (Platos / Bebidas / Combos) que tenga items:
///       - Section header con icono temático + nombre + contador de subcategorías
///       - Por cada subcategoría: subheader + list de cards editables
///   - Combos: sin nivel intermedio, items directo
///   - Sticky footer: contador total + botón "Agregar al menú" primary
///
/// **Por qué `StatefulWidget` con state local en vez de extender el cubit
/// con `editItem(...)`/`removeItem(...)`/etc.:** la edición en esta
/// pantalla es ULTRA-FRECUENTE (cada keystroke en el name dispararía un
/// emit del cubit, lo que rebuildea TODO el árbol). Manejar la edición
/// localmente con `TextEditingController`s y solo subir el árbol final
/// al cubit cuando el manager confirma da:
///   1. Performance: cero rebuilds ajenos al item editado.
///   2. Cancelación gratis: si el manager cierra la pantalla sin
///      confirmar, los edits se descartan (que es lo correcto — son
///      tentativos).
///   3. Confidence badges estables: la confianza del NLP queda en el
///      `vm.parsedGroups` original como source-of-truth, no se pierde
///      por edits intermedios.
///
/// Cuando el manager toca "Agregar al menú", convertimos el árbol local
/// editado a `List<MenuImportBulkGroupDTO>` y lo pasamos al cubit.
class MenuImportReviewView extends StatefulWidget {
  final String businessMenuUuid;

  /// Origen de los datos. Inmutable — copiamos a una versión editable
  /// local en `initState` y a partir de ahí vivimos en ese state local.
  final List<ParsedCategoryGroupDM> parsedGroups;

  /// Si true, el botón "Agregar al menú" está deshabilitado y muestra
  /// loading. Pasado desde el dispatcher cuando el state del cubit es
  /// `confirming` (in-flight bulk-import al BE).
  final bool confirmingInProgress;

  const MenuImportReviewView({
    super.key,
    required this.businessMenuUuid,
    required this.parsedGroups,
    this.confirmingInProgress = false,
  });

  @override
  State<MenuImportReviewView> createState() => _MenuImportReviewViewState();
}

class _MenuImportReviewViewState extends State<MenuImportReviewView> {
  /// Árbol editable local. Inicializado desde `widget.parsedGroups` y
  /// mutado por las acciones del manager (editar item, eliminar, etc.).
  late List<_EditableGroup> _editableGroups;

  @override
  void initState() {
    super.initState();
    _editableGroups = widget.parsedGroups.map(_EditableGroup.fromParsed).toList();
  }

  @override
  void didUpdateWidget(covariant MenuImportReviewView oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Si el cubit re-emite con nuevos parsedGroups (el manager re-corrió
    // el flow para agregar más fotos), reinicializamos el árbol local.
    // No comparo content (caro) — solo identity reference: si el cubit
    // emitió una nueva lista, asumimos que es por re-fetch.
    if (!identical(oldWidget.parsedGroups, widget.parsedGroups)) {
      _editableGroups = widget.parsedGroups.map(_EditableGroup.fromParsed).toList();
    }
  }

  // ─── Mutations ────────────────────────────────────────────────────────

  void _removeItem(int groupIdx, int? subIdx, int itemIdx) {
    setState(() {
      final group = _editableGroups[groupIdx];
      if (subIdx != null) {
        group.subcategories[subIdx].items.removeAt(itemIdx);
        // Si la subcategoría quedó vacía, la eliminamos también — el
        // manager no querrá ver "Pastas (0 items)" en su menú final.
        if (group.subcategories[subIdx].items.isEmpty) {
          group.subcategories.removeAt(subIdx);
        }
      } else {
        group.combos.removeAt(itemIdx);
      }
    });
  }

  // ─── Build ────────────────────────────────────────────────────────────

  int get _totalItems {
    return _editableGroups.fold(0, (sum, g) {
      final inSubs = g.subcategories.fold<int>(0, (s, sub) => s + sub.items.length);
      return sum + inSubs + g.combos.length;
    });
  }

  void _onConfirm() {
    final dto = _editableGroups.map((g) => g.toBulkDTO()).where((g) => _bulkGroupHasContent(g)).toList();
    context.read<MenuImportCubit>().confirmBulkImport(
          businessMenuUuid: widget.businessMenuUuid,
          editedGroupedMenu: dto,
        );
  }

  static bool _bulkGroupHasContent(MenuImportBulkGroupDTO g) {
    final inSubs = (g.subcategories ?? []).fold<int>(0, (s, sub) => s + sub.items.length);
    final flat = g.items?.length ?? 0;
    return (inSubs + flat) > 0;
  }

  @override
  Widget build(BuildContext context) {
    // **`ListView.builder` + lista plana con Keys únicas**, NO
    // `ListView(children: [...])`. Refactor 2026-05-18 después de dos
    // problemas:
    //   (1) Funcional: el `IconButton(x_circle)` borraba el item
    //       equivocado. Causa: las cards (`_EditableItemCard`) NO tenían
    //       `Key` propio, así que Flutter las emparejaba por POSICIÓN al
    //       reconstruir. Al borrar el item 0, el State del slot 0 (con
    //       sus `TextEditingController` cargados con texto de A) se
    //       reusaba para mostrar el item B en pantalla — el manager veía
    //       texto de A pero al presionar X borraba B. Fix: cada
    //       `_EditableItemCard` recibe `ValueKey('item_${uniqueKey}')`
    //       para que Flutter empareje por identidad, no por slot.
    //   (2) Performance: `ListView(children: [...54 cards...])` construye
    //       TODO el árbol al inicio (54 cards × 3 TextFields + Wrap +
    //       listeners). Scroll laggueaba mucho. `ListView.builder` solo
    //       construye los visibles + un buffer pequeño.
    //
    // La lista plana de filas se genera en `_buildRows()` (cada item /
    // header / spacer = una fila). Cuando el manager elimina un item con
    // `setState`, _buildRows() corre de nuevo pero el `ListView.builder`
    // solo re-renderiza las filas que cambiaron.
    final rows = _buildRows();
    return Scaffold(
      backgroundColor: ui.NeumorphicColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          S.current.aiMenuImportReviewTitle,
          style: FoodlyTextStyles.secondaryTitle.copyWith(
            color: FoodlyThemes.primaryFoodly,
            fontSize: 19,
          ),
        ),
        iconTheme: const IconThemeData(color: FoodlyThemes.primaryFoodly),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        itemCount: rows.length,
        itemBuilder: (_, i) => rows[i],
      ),
      bottomNavigationBar: _StickyFooter(
        totalItems: _totalItems,
        confirmingInProgress: widget.confirmingInProgress,
        onConfirm: _onConfirm,
      ),
    );
  }

  /// Genera la lista plana de filas que el `ListView.builder` consume.
  /// Cada fila es un widget independiente con su propia `Key` cuando lo
  /// requiere (cards de items para que Flutter empareje por identidad).
  ///
  /// **No es un `getter` puro:** se llama desde `build` en cada
  /// reconstrucción. Cheap operation (iteración sobre los grupos sin
  /// allocar TextControllers ni nada pesado). Las cards reales son los
  /// `_EditableItemCard` cuyo State persiste vía Key entre rebuilds.
  List<Widget> _buildRows() {
    final rows = <Widget>[
      _ReviewHeader(totalItems: _totalItems),
      const SizedBox(height: 20),
    ];

    for (var gi = 0; gi < _editableGroups.length; gi++) {
      final group = _editableGroups[gi];
      if (!group.hasContent) continue;

      rows.add(_GroupSectionHeader(
        key: ValueKey('group_${group.categoryName}'),
        categoryName: group.categoryName,
      ));
      rows.add(const SizedBox(height: 12));

      // Subcategorías (Platos / Bebidas).
      for (var si = 0; si < group.subcategories.length; si++) {
        final sub = group.subcategories[si];
        rows.add(_SubcategoryHeader(
          key: ValueKey('sub_${gi}_${si}_${sub.name}'),
          name: sub.name,
        ));
        rows.add(const SizedBox(height: 8));
        for (var ii = 0; ii < sub.items.length; ii++) {
          rows.add(_EditableItemCard(
            // **Key crítico:** sin él, al eliminar items, los States se
            // reusan por slot y borran el item equivocado.
            key: ValueKey('item_${sub.items[ii].uniqueKey}'),
            item: sub.items[ii],
            onRemove: () => _removeItem(gi, si, ii),
          ));
          rows.add(const SizedBox(height: 8));
        }
        rows.add(const SizedBox(height: 8));
      }

      // Combos directos (sin subcategoría intermedia).
      for (var ci = 0; ci < group.combos.length; ci++) {
        rows.add(_EditableItemCard(
          key: ValueKey('item_${group.combos[ci].uniqueKey}'),
          item: group.combos[ci],
          onRemove: () => _removeItem(gi, null, ci),
        ));
        rows.add(const SizedBox(height: 8));
      }

      rows.add(const SizedBox(height: 16));
    }

    return rows;
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Header — banner motivacional + recordatorio del disclaimer
// ─────────────────────────────────────────────────────────────────────────

class _ReviewHeader extends StatelessWidget {
  final int totalItems;
  const _ReviewHeader({required this.totalItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Bootstrap.stars, color: FoodlyThemes.primaryFoodly, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.current.aiMenuImportReviewHeaderTitle(totalItems),
                  style: FoodlyTextStyles.secondaryTitle.copyWith(
                    color: FoodlyThemes.primaryFoodly,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  S.current.aiMenuImportReviewHeaderHint,
                  style: FoodlyTextStyles.cardsSmallSubtitle.copyWith(
                    fontSize: 12,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Sección por categoría raíz (Platos / Bebidas / Combos)
// ─────────────────────────────────────────────────────────────────────────

/// Header de cada categoría raíz (Platos / Bebidas / Combos-Especiales).
///
/// Antes era `_CategoryGroupSection` que englobaba header + items adentro
/// de un Column. Ahora con `ListView.builder` los items son rows
/// independientes, así que este widget solo renderiza el header en sí.
///
/// **Diseño Foodly:** chip neumórfico purple primary con icono temático
/// + nombre grande. Se siente como un section anchor visible al scroll,
/// no como un text plano perdido entre cards.
class _GroupSectionHeader extends StatelessWidget {
  final String categoryName;

  const _GroupSectionHeader({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: Row(
        children: [
          // Icono temático sobre fondo purple soft circular.
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.10),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _iconForCategory(categoryName),
              color: FoodlyThemes.primaryFoodly,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              _localizedCategoryName(categoryName),
              style: FoodlyTextStyles.secondaryTitle.copyWith(
                color: FoodlyThemes.primaryFoodly,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static IconData _iconForCategory(String name) {
    final lower = name.toLowerCase();
    if (lower.contains('bebida') || lower.contains('drink')) return Bootstrap.cup_straw;
    if (lower.contains('combo') || lower.contains('especial') || lower.contains('special')) {
      return Bootstrap.gift_fill;
    }
    return Bootstrap.egg_fried;
  }

  /// Traduce los nombres canónicos al locale activo del manager.
  ///
  /// **Por qué traducimos solo en la VISTA y no en el response del BE
  /// (2026-05-18):** las 3 categorías raíz ("Platos", "Bebidas",
  /// "Combos/Especiales") están hardcoded en español en el prompt de
  /// Gemini (`GeminiMenuParserService::buildPrompt`) porque el BE las
  /// matchea con esas strings exactas en `MenuParserService::isFood`/
  /// `isDrink`/`isCombo` para enrutar al `BusinessFoodCategory` /
  /// `BusinessDrinkCategory` / `BusinessCombo` correcto. Cambiar el
  /// prompt al locale del manager rompería ese matching del BE.
  ///
  /// La solución limpia: el `category_name` del response sigue siendo
  /// canónico (ES) end-to-end (FE→BE, persiste así), pero al RENDERIZAR
  /// al manager mapeamos a `S.current.food` / `.drinks` / `.combos`.
  /// Si en algún momento Gemini devuelve un categoryName fuera del set
  /// canónico (no debería, el prompt lo prohíbe), fallback al raw.
  static String _localizedCategoryName(String canonical) {
    final lower = canonical.toLowerCase();
    if (lower.contains('bebida') || lower.contains('drink')) return S.current.drinks;
    if (lower.contains('combo') || lower.contains('especial') || lower.contains('special')) {
      return S.current.combos;
    }
    if (lower.contains('plato') || lower.contains('prato') || lower.contains('dish') || lower.contains('food')) {
      return S.current.food;
    }
    return canonical;
  }
}

/// Header de subcategoría dentro de Platos/Bebidas (ej. "Pastas",
/// "Carnes", "Cocktails"). Pill purple soft compacta, alineada al inicio.
///
/// Antes era texto plano `Colors.black87` que se confundía con los
/// títulos de las cards. Ahora pill purple soft que claramente delimita
/// el grupo de items que viene a continuación.
class _SubcategoryHeader extends StatelessWidget {
  final String name;

  const _SubcategoryHeader({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          name,
          style: FoodlyTextStyles.secondaryTitle.copyWith(
            color: FoodlyThemes.primaryFoodly,
            fontSize: 12.5,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Card editable de un item — TextFields inline + confidence badge + remove
// ─────────────────────────────────────────────────────────────────────────

class _EditableItemCard extends StatefulWidget {
  final _EditableItem item;
  final VoidCallback onRemove;
  const _EditableItemCard({required this.item, required this.onRemove, super.key});

  @override
  State<_EditableItemCard> createState() => _EditableItemCardState();
}

class _EditableItemCardState extends State<_EditableItemCard> {
  late final TextEditingController _nameCtrl;
  late final TextEditingController _descCtrl;
  late final Map<String, TextEditingController> _priceCtrls;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.item.name)..addListener(() => widget.item.name = _nameCtrl.text);
    _descCtrl = TextEditingController(text: widget.item.description ?? '')
      ..addListener(() => widget.item.description = _descCtrl.text.isEmpty ? null : _descCtrl.text);

    _priceCtrls = {};
    for (final v in widget.item.versions) {
      final ctrl = TextEditingController(text: (widget.item.prices[v] ?? 0).toString());
      ctrl.addListener(() {
        widget.item.prices[v] = double.tryParse(ctrl.text.replaceAll(',', '.')) ?? 0;
      });
      _priceCtrls[v] = ctrl;
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _descCtrl.dispose();
    for (final c in _priceCtrls.values) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // **Sin `Dismissible`** (removido 2026-05-18). El swipe-to-delete
    // causaba un race condition irrecuperable con el ListView padre:
    //   - Dismissible iniciaba animación al confirmar el swipe.
    //   - `onDismissed: (_) => widget.onRemove()` disparaba `setState` en
    //     el parent state → el ListView reconstruía todo su `children: []`.
    //   - El Dismissible que se estaba dismissing recibía un nuevo parent
    //     mid-animation → parentData inconsistent → assertion crítica
    //     `'!semantics.parentDataDirty': is not true` en loop infinito.
    //     Flutter blameaba al último widget del layout pass (el footer del
    //     Scaffold), pero el culprit real era el Dismissible.
    //
    // La UX de delete se mantiene 1:1 vía el `IconButton(x_circle)` que
    // ya está en el header de la card (línea ~438 más abajo). El manager
    // tiene su botón explícito para eliminar; el swipe era nice-to-have.
    //
    // Si en el futuro queremos swipe-to-delete, usar `flutter_slidable`
    // que maneja mejor el ciclo de vida con ListView dinámicos. NUNCA
    // volver al patrón `Dismissible + setState directo + ListView children: [...]`.
    // **Diseño Foodly:** card blanca con sombra purple soft (NO border
    // duro de color confidence). El indicador de confidence es una barra
    // vertical lateral colorida + badge de texto al lado del nombre.
    // Patrón mucho más limpio que el border completo coloreado que
    // dominaba toda la card. Refactor 2026-05-18.
    final confidenceColor = _confidenceColor(widget.item.confidence);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border(left: BorderSide(color: confidenceColor, width: 4)),
        boxShadow: [
          BoxShadow(
            color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.06),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 12, 6, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Row: nombre + badge confidence + botón eliminar.
                    Row(
                      children: [
                        Expanded(
                          child: FoodlyPrimaryInputText(
                            controller: _nameCtrl,
                            height: 39,
                            enabled: true,
                            contentPadding: const EdgeInsets.all(6),
                            style: FoodlyTextStyles.secondaryTitle.copyWith(
                              fontSize: 15,
                              color: FoodlyThemes.primaryFoodly,
                              fontWeight: FontWeight.w700,
                            ),
                            inputTextType: FoodlyInputType.generic,
                            autovalidateMode: AutovalidateMode.disabled,
                          ),
                        ),
                        const SizedBox(width: 6),
                        _ConfidenceBadge(confidence: widget.item.confidence),
                        const SizedBox(width: 2),
                        // X button: container circular purple soft —
                        // visible pero no agresivo. Antes era un
                        // IconButton gris perdido.
                        Material(
                          color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.08),
                          shape: const CircleBorder(),
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: widget.onRemove,
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: Icon(
                                Bootstrap.x,
                                size: 23,
                                color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.7),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).paddingBottom(9),
                    // Description: solo se ve si tiene texto o el manager
                    // la enfoca. Quitamos el min/max lines 1-2 que dejaba
                    // un espacio gris-azulado feo cuando no había texto.
                    TextField(
                      controller: _descCtrl,
                      maxLines: 3,
                      minLines: 1,
                      style: FoodlyTextStyles.cardsSmallSubtitle.copyWith(
                        fontSize: 12.5,
                        color: Colors.black87,
                        height: 1.35,
                      ),
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(6),
                        isDense: true,
                        border: InputBorder.none,
                        hintText: S.current.aiMenuImportReviewDescriptionHint,
                        hintStyle: FoodlyTextStyles.cardsSmallSubtitle.copyWith(
                          fontSize: 12,
                          color: FoodlyThemes.secondaryFoodly,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Precios — Wrap con chips por versión.
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.item.versions
                          .map((v) => _PriceField(
                                version: v,
                                controller: _priceCtrls[v]!,
                                showLabel: widget.item.versions.length > 1,
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Color _confidenceColor(double? conf) {
    if (conf == null) return Colors.black12;
    if (conf >= 0.75) return const Color(0xFF14C45D); // tertiaryFoodly green
    if (conf >= 0.50) return const Color(0xFFFFA726); // amber
    return const Color(0xFFE53935); // red
  }
}

/// Pill chip que indica la confianza del parser para el item completo.
///
/// **Refactor 2026-05-18:** antes era solo texto en pill colorida.
/// Ahora pill con ÍCONO + texto — visible a primera vista qué items
/// requieren revisión sin tener que leer cada label. Tres estados:
///   ≥ 0.75 → ✓ verde tertiary (OK, alta confianza)
///   0.50–0.75 → ⚠ ámbar (revisar)
///   < 0.50 → ⚠ rojo (verificar — probablemente mal extraído)
class _ConfidenceBadge extends StatelessWidget {
  final double? confidence;
  const _ConfidenceBadge({required this.confidence});

  @override
  Widget build(BuildContext context) {
    if (confidence == null) return const SizedBox.shrink();

    final (Color bg, Color fg, IconData icon, String label) = switch (confidence!) {
      >= 0.75 => (
          const Color(0xFF14C45D).withValues(alpha: 0.12), // tertiaryFoodly soft
          const Color(0xFF0E8C44),
          Bootstrap.check_circle_fill,
          S.current.aiMenuImportReviewConfidenceOk,
        ),
      >= 0.50 => (
          const Color(0xFFFFF4E0),
          const Color(0xFFD17A0E),
          Bootstrap.exclamation_circle_fill,
          S.current.aiMenuImportReviewConfidenceCheck,
        ),
      _ => (
          const Color(0xFFFCE8E8),
          const Color(0xFFC02828),
          Bootstrap.exclamation_triangle_fill,
          S.current.aiMenuImportReviewConfidenceVerify,
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: fg),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.5,
              color: fg,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}

/// Chip de precio editable. Una versión = un chip independiente con
/// label (solo si hay >1 versión) + input con € prefix.
///
/// **Refactor 2026-05-18:** ahora con prefix € visible — antes el
/// manager veía un número desnudo sin contexto monetario.
class _PriceField extends StatelessWidget {
  final String version;
  final TextEditingController controller;
  final bool showLabel;

  const _PriceField({required this.version, required this.controller, required this.showLabel});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 96, maxWidth: 170),
      child: Container(
        decoration: BoxDecoration(
          color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.12),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showLabel) ...[
              Text(
                _localizedVersion(version),
                style: FoodlyTextStyles.cardsSmallSubtitle.copyWith(
                  fontSize: 11,
                  color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(width: 6),
              Container(
                width: 1,
                height: 14,
                color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.18),
              ),
              const SizedBox(width: 6),
            ],
            Text(
              '€',
              style: FoodlyTextStyles.secondaryTitle.copyWith(
                fontSize: 13,
                color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.6),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Theme(
                data: Theme.of(context).copyWith(
                  inputDecorationTheme: const InputDecorationTheme(
                    border: InputBorder.none,
                    errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                  ),
                ),
                child: TextField(
                  controller: controller,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
                  ],
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  style: FoodlyTextStyles.secondaryTitle.copyWith(
                    fontSize: 14,
                    color: FoodlyThemes.primaryFoodly,
                    fontWeight: FontWeight.w800,
                  ),
                  decoration: InputDecoration.collapsed(
                    hintText: '',
                    filled: true,
                    fillColor: FoodlyThemes.primaryFoodly.withValues(alpha: 0.16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String _localizedVersion(String version) {
    switch (version.toLowerCase()) {
      case 'regular':
        return S.current.aiMenuImportReviewVersionRegular;
      case 'medium':
        return S.current.aiMenuImportReviewVersionMedium;
      case 'big':
        return S.current.aiMenuImportReviewVersionBig;
      default:
        return version;
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Sticky footer con contador + botón confirmar
// ─────────────────────────────────────────────────────────────────────────

class _StickyFooter extends StatelessWidget {
  final int totalItems;
  final bool confirmingInProgress;
  final VoidCallback onConfirm;

  const _StickyFooter({
    required this.totalItems,
    required this.confirmingInProgress,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    // **Sin `Positioned` wrapper** — este widget vive en
    // `Scaffold.bottomNavigationBar`, NO dentro de un Stack. El slot
    // bottomNavigationBar le pasa al hijo constraints `tight-width /
    // loose-height` (ancho fijo del Scaffold, altura wrap-content), y
    // maneja automáticamente el inset del teclado.
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        // **Column vertical, NO Row horizontal:** counter arriba + botón
        // full-width abajo. Antes era un `Row(Expanded(Text counter),
        // SizedBox, CustomNeumorphicButton)` que crasheaba con
        // `'RenderFlex children have non-zero flex but incoming width
        // constraints are unbounded'` cuando:
        //   1. El idioma del manager tenía strings largos (PT-PT
        //      "Adicionar ao menu" + "Serão adicionados 64 itens").
        //   2. + system font scale alto (1.3x default en muchos Android
        //      tablets / accessibility settings).
        //   El Expanded(Text) tomaba todo el width, el botón quedaba sin
        //   constraint, y propagaba unbounded al `Row(Expanded(Center))`
        //   interno del `CustomNeumorphicButton` (línea 178 de su
        //   implementación) → assertion fail crítico.
        // Vertical stack es robusto a cualquier idioma / font scale, y
        // el botón full-width es más mobile-native para una CTA primary.
        // Bug detectado 2026-05-18.
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              S.current.aiMenuImportReviewFooterCount(totalItems),
              style: FoodlyTextStyles.cardsSmallSubtitle.copyWith(
                fontSize: 13,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            CustomNeumorphicButton(
              onPressed: totalItems == 0 || confirmingInProgress ? null : onConfirm,
              text: confirmingInProgress
                  ? S.current.aiMenuImportReviewConfirming
                  : S.current.aiMenuImportReviewConfirmCta,
              leading: confirmingInProgress
                  ? const SizedBox.square(
                      dimension: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    )
                  : const Icon(Bootstrap.check2_circle, size: 18, color: Colors.white),
              disabled: totalItems == 0 || confirmingInProgress,
              fontSize: 13,
              bosShapeRadius: 8,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Modelos editables locales
// ─────────────────────────────────────────────────────────────────────────

/// Espejo mutable de `ParsedCategoryGroupDM` para que la pantalla pueda
/// editar inplace (Freezed es immutable, no nos sirve acá).
class _EditableGroup {
  final String categoryName;
  final List<_EditableSubcategory> subcategories;

  /// Solo para combos — items directos sin subcategoría.
  final List<_EditableItem> combos;

  _EditableGroup({
    required this.categoryName,
    required this.subcategories,
    required this.combos,
  });

  factory _EditableGroup.fromParsed(ParsedCategoryGroupDM source) {
    final subs = (source.subcategories ?? []).map(_EditableSubcategory.fromParsed).toList();
    final flat = (source.items ?? []).map(_EditableItem.fromParsed).toList();
    return _EditableGroup(
      categoryName: source.categoryName,
      subcategories: subs,
      combos: flat,
    );
  }

  bool get hasContent => subcategories.any((s) => s.items.isNotEmpty) || combos.isNotEmpty;

  MenuImportBulkGroupDTO toBulkDTO() {
    final bulkSubs = subcategories
        .where((s) => s.items.isNotEmpty)
        .map((s) => MenuImportBulkSubcategoryDTO(
              subcategoryName: s.name,
              items: s.items.map((i) => i.toBulkDTO()).toList(),
            ))
        .toList();

    return MenuImportBulkGroupDTO(
      categoryName: categoryName,
      subcategories: bulkSubs.isEmpty ? null : bulkSubs,
      items: combos.isEmpty ? null : combos.map((i) => i.toBulkDTO()).toList(),
    );
  }
}

class _EditableSubcategory {
  final String name;
  final List<_EditableItem> items;

  _EditableSubcategory({required this.name, required this.items});

  factory _EditableSubcategory.fromParsed(ParsedSubcategoryDM s) => _EditableSubcategory(
        name: s.subcategoryName,
        items: s.items.map(_EditableItem.fromParsed).toList(),
      );
}

class _EditableItem {
  String name;
  String? description;
  final List<String> versions;
  final Map<String, double> prices;
  final double? confidence;

  /// Key estable para `ValueKey` del Dismissible. Necesaria porque
  /// `ListView` puede reutilizar widgets cuando uno se elimina.
  final String uniqueKey;

  _EditableItem({
    required this.name,
    required this.description,
    required this.versions,
    required this.prices,
    required this.confidence,
    required this.uniqueKey,
  });

  factory _EditableItem.fromParsed(ParsedMenuItemDM item) {
    final versions =
        (item.versions == null || item.versions!.isEmpty) ? ['regular'] : List<String>.from(item.versions!);
    return _EditableItem(
      name: item.name,
      description: item.description,
      versions: versions,
      prices: Map<String, double>.from(item.pricesAsDouble),
      confidence: item.confidence,
      // name + hash random sería mejor pero el flow es corto y los nombres
      // suelen ser únicos por subcategoría. Si hay colisión, el usuario
      // puede editarlo y queda otra key para el próximo render.
      uniqueKey: '${item.name}_${item.confidence ?? "?"}_${DateTime.now().microsecondsSinceEpoch}',
    );
  }

  MenuImportBulkItemDTO toBulkDTO() => MenuImportBulkItemDTO(
        name: name.trim(),
        description: description?.trim(),
        versions: versions,
        prices: prices,
      );
}
