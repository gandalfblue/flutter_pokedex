import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/pokemon_constants.dart';
import '../../../../core/utils/pokemon_type_utils.dart';
import '../../../l10n/app_localizations.dart';
import '../providers/pokemon_filter_provider.dart';

class PokemonFilterModalWidget extends ConsumerWidget {
  const PokemonFilterModalWidget({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const PokemonFilterModalWidget(),
    );
  }

  // ── Build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(pokemonFilterNotifierProvider);
    final notifier = ref.read(pokemonFilterNotifierProvider.notifier);

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.5,
      maxChildSize: 0.92,
      builder: (_, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              // ── Handle ─────────────────────────────────────────────────
              const SizedBox(height: 12),
              Center(
                child: Container(
                  width: 40, height: 4,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // ── Título + botón limpiar ──────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Builder(builder: (context) {
                  final l10n = AppLocalizations.of(context)!;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.filterModalTitle,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1D1D1D),
                        ),
                      ),
                      if (filter.hasActiveFilter)
                        TextButton.icon(
                          onPressed: notifier.clearAll,
                          icon: const Icon(Icons.clear_outlined, size: 18),
                          label: Text(l10n.filterModalClearAll),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red[400],
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            textStyle: const TextStyle(fontSize: 13),
                          ),
                        ),
                    ],
                  );
                }),
              ),

              // ── Selector de categoría (chips horizontales) ──────────────
              const SizedBox(height: 12),
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemCount: PokemonConstants.categories.length,
                  itemBuilder: (_, i) {
                    final item = PokemonConstants.categories[i];
                    final isActive = filter.activeCategory == item.cat;

                    final hasValue = switch (item.cat) {
                      FilterCategory.type       => filter.selectedTypes.isNotEmpty,
                      FilterCategory.generation => filter.selectedGeneration != null,
                      FilterCategory.height     => filter.heightRange != null,
                      FilterCategory.weight     => filter.weightRange != null,
                    };

                    return GestureDetector(
                      onTap: () => notifier.setCategory(item.cat),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: isActive
                              ? const Color(0xFF1D1D1D)
                              : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20),
                          border: hasValue && !isActive
                              ? Border.all(
                                  color: const Color(0xFF6390F0), width: 1.5)
                              : null,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              item.icon,
                              size: 15,
                              color: isActive ? Colors.white : Colors.black54,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              item.label,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: isActive ? Colors.white : Colors.black54,
                              ),
                            ),
                            if (hasValue) ...[
                              const SizedBox(width: 4),
                              Container(
                                width: 7, height: 7,
                                decoration: BoxDecoration(
                                  color: isActive
                                      ? Colors.white
                                      : const Color(0xFF6390F0),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 4),
              const Divider(height: 16, thickness: 1),

              // ── Contenido dinámico según categoría ──────────────────────
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                  child: _buildCategoryContent(context, filter, notifier),
                ),
              ),

              // ── Botón Aplicar ───────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Builder(builder: (context) {
                    final l10n = AppLocalizations.of(context)!;
                    return ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1D1D1D),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        filter.hasActiveFilter
                            ? l10n.filterModalApply
                            : l10n.filterModalViewAll,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ── Contenido por categoría ──────────────────────────────────────────────

  Widget _buildCategoryContent(
    BuildContext context,
    PokemonFilterState filter,
    PokemonFilterNotifier notifier,
  ) {
    return switch (filter.activeCategory) {
      FilterCategory.type       => _TypeContent(filter: filter, notifier: notifier),
      FilterCategory.generation => _GenerationContent(filter: filter, notifier: notifier),
      FilterCategory.height     => _HeightContent(filter: filter, notifier: notifier),
      FilterCategory.weight     => _WeightContent(filter: filter, notifier: notifier),
    };
  }
}

// ── Contenido: Tipos ────────────────────────────────────────────────────────

class _TypeContent extends StatelessWidget {
  final PokemonFilterState filter;
  final PokemonFilterNotifier notifier;

  const _TypeContent({required this.filter, required this.notifier});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Text(
          filter.selectedTypes.isEmpty
              ? l10n.filterTypeSelectHint
              : l10n.filterTypeSelected(filter.selectedTypes.length),
          style: const TextStyle(fontSize: 13, color: Colors.black45),
        ),
        const SizedBox(height: 12),
        // Lista tipo → checkbox
        ...List.generate(PokemonConstants.types.length, (i) {
          final type = PokemonConstants.types[i];
          final isSelected = filter.selectedTypes.contains(type);
          final color = PokemonTypeUtils.typeColor(type);
          final textColor = PokemonTypeUtils.typeTextColor(type);

          return GestureDetector(
            onTap: () => notifier.toggleType(type),
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected
                    ? color
                    : PokemonTypeUtils.typeColor(type).withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? color : color.withValues(alpha: 0.3),
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  // Ícono del tipo
                  Container(
                    width: 32, height: 32,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.white.withValues(alpha: 0.25)
                          : color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: PokemonTypeUtils.typeIcon(type, size: 18),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Nombre del tipo
                  Expanded(
                    child: Text(
                      PokemonTypeUtils.typeName(type),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? textColor : const Color(0xFF1D1D1D),
                      ),
                    ),
                  ),
                  // Checkbox visual
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 24, height: 24,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.transparent,
                      border: Border.all(
                        color: isSelected
                            ? Colors.white
                            : color.withValues(alpha: 0.6),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: isSelected
                        ? Icon(Icons.check_rounded, size: 16, color: color)
                        : null,
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}

// ── Contenido: Generación ────────────────────────────────────────────────────

class _GenerationContent extends StatelessWidget {
  final PokemonFilterState filter;
  final PokemonFilterNotifier notifier;

  const _GenerationContent({required this.filter, required this.notifier});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Text(
          l10n.filterGenerationHint,
          style: const TextStyle(fontSize: 13, color: Colors.black45),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.8,
          ),
          itemCount: PokemonConstants.generations.length,
          itemBuilder: (_, i) {
            final gen = PokemonConstants.generations[i];
            final isSelected = filter.selectedGeneration == gen.value;

            return GestureDetector(
              onTap: () => notifier.setGeneration(gen.value),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF1D1D1D)
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFF1D1D1D)
                        : Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      gen.label,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : const Color(0xFF1D1D1D),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      gen.range,
                      style: TextStyle(
                        fontSize: 10,
                        color: isSelected ? Colors.white60 : Colors.black38,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

// ── Contenido: Altura ────────────────────────────────────────────────────────

class _HeightContent extends StatelessWidget {
  final PokemonFilterState filter;
  final PokemonFilterNotifier notifier;

  const _HeightContent({required this.filter, required this.notifier});

  @override
  Widget build(BuildContext context) => _OptionGrid(
        label: AppLocalizations.of(context)!.filterHeightHint,
        items: PokemonConstants.heights
            .map((h) => _OptionItem(
                  label: h.label,
                  sub: h.sub,
                  icon: h.icon,
                  value: h.value,
                  isSelected: filter.heightRange == h.value,
                  onTap: () => notifier.setHeightRange(h.value),
                ))
            .toList(),
      );
}

// ── Contenido: Peso ──────────────────────────────────────────────────────────

class _WeightContent extends StatelessWidget {
  final PokemonFilterState filter;
  final PokemonFilterNotifier notifier;

  const _WeightContent({required this.filter, required this.notifier});

  @override
  Widget build(BuildContext context) => _OptionGrid(
        label: AppLocalizations.of(context)!.filterWeightHint,
        items: PokemonConstants.weights
            .map((w) => _OptionItem(
                  label: w.label,
                  sub: w.sub,
                  icon: w.icon,
                  value: w.value,
                  isSelected: filter.weightRange == w.value,
                  onTap: () => notifier.setWeightRange(w.value),
                ))
            .toList(),
      );
}

// ── Widgets auxiliares ───────────────────────────────────────────────────────

class _OptionItem {
  final String label;
  final String sub;
  final IconData icon;
  final String value;
  final bool isSelected;
  final VoidCallback onTap;

  const _OptionItem({
    required this.label,
    required this.sub,
    required this.icon,
    required this.value,
    required this.isSelected,
    required this.onTap,
  });
}

class _OptionGrid extends StatelessWidget {
  final String label;
  final List<_OptionItem> items;

  const _OptionGrid({required this.label, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Colors.black45),
        ),
        const SizedBox(height: 16),
        Row(
          children: items.map((item) {
            return Expanded(
              child: GestureDetector(
                onTap: item.onTap,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                  decoration: BoxDecoration(
                    color: item.isSelected
                        ? const Color(0xFF1D1D1D)
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: item.isSelected
                          ? const Color(0xFF1D1D1D)
                          : Colors.grey.shade300,
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        item.icon,
                        size: 28,
                        color: item.isSelected ? Colors.white : Colors.black54,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: item.isSelected
                              ? Colors.white
                              : const Color(0xFF1D1D1D),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.sub,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: item.isSelected ? Colors.white60 : Colors.black38,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
