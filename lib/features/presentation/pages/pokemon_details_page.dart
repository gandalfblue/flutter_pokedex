import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_pokemon/features/presentation/widgets/pokeball_progress_indicator_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/utils/pokemon_type_utils.dart';
import '../../domain/entities/pokemon_entity.dart';
import '../../domain/entities/pokemon_type_entity.dart';
import '../providers/pokemon_detail_provider.dart';
import '../providers/pokemon_favorites_provider.dart';
import '../providers/pokemon_weaknesses_provider.dart';
import '../widgets/bottom_nav_pokemon_widget.dart';
import '../widgets/pokemon_detail_header_widget.dart';
import '../widgets/pokemon_detail_info_card_widget.dart';
import '../widgets/pokemon_gender_bar_widget.dart';

import '../widgets/pokemon_type_chip_widget.dart';

/// Página de detalle de un Pokémon.
///
/// Recibe el [pokemonName] (slug de la PokéAPI) y carga los datos via
/// [pokemonDetailProvider].  Mientras carga muestra un indicador; si hay
/// error muestra un mensaje descriptivo.
class PokemonDetailPage extends ConsumerStatefulWidget {
  final String pokemonName;

  const PokemonDetailPage({super.key, required this.pokemonName});

  @override
  ConsumerState<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends ConsumerState<PokemonDetailPage>
    with TickerProviderStateMixin {
  // ── Controladores de animación ───────────────────────────────────────────
  late final AnimationController _entryCtrl;
  late final AnimationController _statsCtrl;
  late final AnimationController _genderCtrl;

  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;
  late final Animation<double> _genderAnim;

  @override
  void initState() {
    super.initState();

    _entryCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _statsCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _genderCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));

    _fadeAnim = CurvedAnimation(parent: _entryCtrl, curve: Curves.easeOut);
    _slideAnim =
        Tween<Offset>(begin: const Offset(0, 0.06), end: Offset.zero).animate(
      CurvedAnimation(parent: _entryCtrl, curve: Curves.easeOut),
    );

    _genderAnim =
        CurvedAnimation(parent: _genderCtrl, curve: Curves.easeOutCubic);

    _entryCtrl.forward();
    Future.delayed(const Duration(milliseconds: 350),
        () => mounted ? _statsCtrl.forward() : null);
    Future.delayed(const Duration(milliseconds: 500),
        () => mounted ? _genderCtrl.forward() : null);
  }

  @override
  void dispose() {
    _entryCtrl.dispose();
    _statsCtrl.dispose();
    _genderCtrl.dispose();
    super.dispose();
  }

  // ── Build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final asyncPokemon = ref.watch(
      pokemonDetailProvider(pokemonName: widget.pokemonName),
    );

    return asyncPokemon.when(
      loading: _buildLoading,
      error: _buildError,
      data: _buildContent,
    );
  }

  // ── Estados ──────────────────────────────────────────────────────────────

  Widget _buildLoading() {
    return const Scaffold(
      backgroundColor: Color(0xFFF4F6F8),
      body: Center(child: PokeballProgressIndicator()),
    );
  }

  Widget _buildError(Object error, StackTrace _) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () => context.go(AppRoutes.pokemonList),
              icon: const Icon(Icons.arrow_back_ios_new))),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Builder(builder: (ctx) {
            final l10n = AppLocalizations.of(ctx)!;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline_rounded,
                    size: 56, color: Colors.redAccent),
                const SizedBox(height: 16),
                Text(
                  l10n.detailErrorTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black45, fontSize: 13),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildContent(PokemonEntity pokemon) {
    final primaryColor = pokemon.types.isNotEmpty
        ? PokemonTypeUtils.typeColor(pokemon.types.first.name)
        : const Color(0xFFA8A77A);

    final isFavorite = ref.watch(
      pokemonFavoritesNotifierProvider
          .select((list) => list.any((p) => p.id == pokemon.id)),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavPokemonWidget(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ── Sliver App Bar ─────────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
                onPressed: () => context.go(AppRoutes.pokemonList),
                icon: Icon(Icons.arrow_back_ios_new)),
            actions: [
              IconButton(
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    isFavorite
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    key: ValueKey(isFavorite),
                    color: isFavorite ? Colors.red[300] : Colors.white,
                    size: 26,
                  ),
                ),
                onPressed: () => ref
                    .read(pokemonFavoritesNotifierProvider.notifier)
                    .toggle(pokemon),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: PokemonDetailHeaderWidget(pokemon: pokemon),
            ),
          ),

          // ── Cuerpo animado ─────────────────────────────────────────────
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _fadeAnim,
              child: SlideTransition(
                position: _slideAnim,
                child: _PokemonBody(
                  pokemon: pokemon,
                  primaryColor: primaryColor,
                  genderAnim: _genderAnim,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Cuerpo scrollable del detalle
// ─────────────────────────────────────────────────────────────────────────────

class _PokemonBody extends ConsumerWidget {
  final PokemonEntity pokemon;
  final Color primaryColor;
  final Animation<double> genderAnim;

  const _PokemonBody({
    required this.pokemon,
    required this.primaryColor,
    required this.genderAnim,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final heightM = (pokemon.height / 10).toStringAsFixed(1);
    final weightKg = (pokemon.weight / 10).toStringAsFixed(1);
    final formattedId = 'N°${pokemon.id.toString().padLeft(3, '0')}';

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Nombre ───────────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
                PokemonTypeUtils.typeName(pokemon.name),
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  letterSpacing: -0.5,
                  shadows: [Shadow(blurRadius: 8, color: Colors.black26)],
                ),
              ),
          ),
          // ── Número de Pokédex ────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
                formattedId,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.black.withValues(alpha: 0.7),
                  letterSpacing: 1,
                ),
              ),
          ),
          const SizedBox(height: 28),
          // ── Chips de tipo ────────────────────────────────────────────────
          Row(
            children: pokemon.types
                .map((t) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TypeChipWidget(type: t),
            ))
                .toList(),
          ),
          const SizedBox(height: 16),
          // ── Descripción Pokédex ──────────────────────────────────────────
          if (pokemon.description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                pokemon.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withValues(alpha: 0.65),
                  height: 1.5,
                ),
              ),
            ),
          const SizedBox(height: 28),
          Builder(builder: (context) {
            final l10n = AppLocalizations.of(context)!;
            return Column(
              children: [
                _buildInfoGrid(
                    label1: l10n.detailWeightLabel,
                    und1: 'kg',
                    icon1: Icons.fitness_center,
                    value1: weightKg,
                    label2: l10n.detailHeightLabel,
                    und2: 'm',
                    icon2: Icons.height_rounded,
                    value2: heightM),
                const SizedBox(height: 28),
                _buildInfoGrid(
                    label1: l10n.detailCategoryLabel,
                    und1: '',
                    icon1: Icons.category_outlined,
                    value1: pokemon.category.isNotEmpty ? pokemon.category : l10n.detailNa,
                    label2: l10n.detailAbilityLabel,
                    und2: '',
                    icon2: Icons.catching_pokemon,
                    value2: pokemon.abilities.isNotEmpty ? pokemon.abilities.first : l10n.detailNa),
              ],
            );
          }),
          const SizedBox(height: 28),
          _buildGender(),
          const SizedBox(height: 28),
          _buildWeaknesses(ref),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  // ── Cuadrícula de info (peso / altura) ────────────────────────────────────

  Widget _buildInfoGrid(
      {required String label1,
      required String und1,
      required IconData icon1,
      required String value1,
      required String label2,
      required String und2,
      required IconData icon2,
      required String value2}) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          PokemonDetailInfoCardWidget(
            icon: icon1,
            label: label1,
            value: '$value1 $und1',
            accent: primaryColor,
          ),
          const SizedBox(width: 14),
          PokemonDetailInfoCardWidget(
            icon: icon2,
            label: label2,
            value: '$value2 $und2',
            accent: primaryColor,
          ),
        ],
      ),
    );
  }

  // ── Género ───────────────────────────────────────────────────────────────

  Widget _buildGender() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Builder(builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionLabel(label: l10n.detailGenderLabel),
            const SizedBox(height: 14),
            PokemonGenderBarWidget(
              maleRatio: 50,
              animation: genderAnim,
            ),
          ],
        );
      }),
    );
  }

  // ── Debilidades ───────────────────────────────────────────────────────────

  Widget _buildWeaknesses(WidgetRef ref) {
    final typeNames = pokemon.types.map((t) => t.name).join(',');
    final asyncWeak = ref.watch(pokemonWeaknessesProvider(typeNames));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Builder(builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionLabel(label: l10n.detailWeaknessesLabel),
            const SizedBox(height: 14),
            asyncWeak.when(
              loading: () => const SizedBox(
                height: 32,
                child: Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: PokeballProgressIndicator(),
                  ),
                ),
              ),
              error: (_, __) => Text(
                l10n.detailWeaknessesError,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
              ),
              data: (weakList) => weakList.isEmpty
                  ? Text(
                      l10n.detailNoWeaknesses,
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                    )
                  : Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: weakList
                          .map((t) => TypeChipWidget(
                                type: PokemonTypeEntity(name: t),
                              ))
                          .toList(),
                    ),
            ),
          ],
        );
      }),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Label de sección reutilizable internamente
// ─────────────────────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w800,
        color: Color(0xFF9CA3AF),
        letterSpacing: 1.5,
      ),
    );
  }
}
