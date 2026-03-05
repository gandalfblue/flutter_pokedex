import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../providers/auth_provider.dart';
import '../providers/pokemon_favorites_provider.dart';
import '../providers/pokemon_list_provider.dart';
import '../providers/trainer_profile_provider.dart';
import '../widgets/bottom_nav_pokemon_widget.dart';
import '../widgets/profile_achievement_item_widget.dart';
import '../widgets/profile_avatar_widget.dart';
import '../widgets/profile_favorite_type_widget.dart';
import '../widgets/profile_stat_card_widget.dart';

// ── Utilidad: avatar según género ────────────────────────────────────────────
String _avatarForGender(TrainerGender? gender) {
  if (gender == TrainerGender.trainerFemale) {
    return 'assets/images/entrenadora.png';
  }
  return 'assets/images/entrenador.png';
}

/// Devuelve true si el asset es uno de los defaults del sistema.
bool _isDefaultAvatar(String asset) => [
      'assets/images/entrenador.png',
      'assets/images/entrenadora.png',
      'assets/images/Profesor_onboarding.png',
      'assets/images/niño_explorador_onboarding.png',
    ].contains(asset);

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _syncFavorites();
    });
  }

  void _syncFavorites() {
    final favorites = ref.read(pokemonFavoritesNotifierProvider);
    final typeNames =
        favorites.expand((p) => p.types.map((t) => t.name)).toList();
    ref
        .read(trainerProfileNotifierProvider.notifier)
        .syncFavorites(typeNames, favorites.length);
  }

  // Avatares disponibles en assets
  static const _avatarOptions = [
    'assets/images/entrenador.png',
    'assets/images/entrenadora.png',
  ];

  // ── Cerrar sesión ────────────────────────────────────────────────────────
  void _confirmLogout(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(l10n.authLogout,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        content: Text(l10n.authLogoutConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.authLogoutConfirmNo),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFCC0000),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              Navigator.pop(ctx);
              ref.read(authNotifierProvider.notifier).logout();
              // El router redirige automáticamente a /login via refreshListenable
            },
            child: Text(l10n.authLogoutConfirmYes),
          ),
        ],
      ),
    );
  }

  // ── Edición de nombre ────────────────────────────────────────────────────
  void _showEditNameDialog(BuildContext context, String currentName) {
    final l10n = AppLocalizations.of(context)!;
    final controller = TextEditingController(text: currentName);
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(l10n.profileEditName,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        content: TextField(
          controller: controller,
          autofocus: true,
          maxLength: 20,
          decoration: InputDecoration(
            hintText: l10n.profileEditNameHint,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.profileCancel),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFCC0000),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              ref
                  .read(trainerProfileNotifierProvider.notifier)
                  .updateName(controller.text);
              Navigator.pop(ctx);
            },
            child: Text(l10n.profileSave),
          ),
        ],
      ),
    );
  }

  // ── Selector de avatar ───────────────────────────────────────────────────
  void _showAvatarPicker(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.profileAvatarSectionTitle,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _avatarOptions.map((asset) {
                return GestureDetector(
                  onTap: () {
                    ref
                        .read(trainerProfileNotifierProvider.notifier)
                        .updateAvatar(asset);
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade100,
                      border: Border.all(
                          color: const Color(0xFFCC0000), width: 2),
                    ),
                    child: ClipOval(
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Image.asset(asset,
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) => const Icon(
                                Icons.person_rounded,
                                size: 40,
                                color: Color(0xFFCC0000))),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }


  // ── Build ────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final profile = ref.watch(trainerProfileNotifierProvider);
    final favorites = ref.watch(pokemonFavoritesNotifierProvider);
    final listState = ref.watch(pokemonListNotifierProvider);
    final authUser = ref.watch(authNotifierProvider).user;

    final trainerLevel =
        ref.read(trainerProfileNotifierProvider.notifier).computedLevel;

    // Si el avatar es uno de los defaults del sistema, se determina por el género.
    // Si el usuario lo cambió manualmente se respeta su elección.
    final genderAvatar = _avatarForGender(authUser?.gender);
    final avatarAsset =
        _isDefaultAvatar(profile.avatarAsset) ? genderAvatar : profile.avatarAsset;

    // Nombre a mostrar: primero el que el usuario haya editado,
    // si sigue siendo el default usamos el username registrado.
    final displayName = profile.name == 'Entrenador' && authUser != null
        ? authUser.username
        : profile.name;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  // ── Header ────────────────────────────────────────────
                  SliverToBoxAdapter(
                    child: _ProfileHeader(
                      profile: profile.copyWith(
                          name: displayName, avatarAsset: avatarAsset),
                      trainerLevel: trainerLevel,
                      l10n: l10n,
                      genderLabel: authUser?.gender ==
                              TrainerGender.trainerFemale
                          ? l10n.registerGenderTrainerFemale
                          : l10n.registerGenderTrainer,
                      onEditName: () =>
                          _showEditNameDialog(context, displayName),
                      onEditAvatar: () => _showAvatarPicker(context),
                      onLogout: () => _confirmLogout(context),
                    ),
                  ),

                  // ── Estadísticas ──────────────────────────────────────
                  SliverToBoxAdapter(
                    child: _StatsSection(
                      viewed: listState.pokemons.length,
                      favorites: favorites.length,
                      level: trainerLevel,
                      l10n: l10n,
                    ),
                  ),

                  // ── Tipo favorito ─────────────────────────────────────
                  SliverToBoxAdapter(
                    child: _FavoriteTypeSection(
                      typeName: profile.favoriteType,
                      l10n: l10n,
                    ),
                  ),

                  // ── Logros ────────────────────────────────────────────
                  SliverToBoxAdapter(
                    child: _AchievementsSection(
                      viewed: listState.pokemons.length,
                      favorites: favorites.length,
                      l10n: l10n,
                    ),
                  ),

                  // ── Acerca de ─────────────────────────────────────────
                  SliverToBoxAdapter(
                    child: _AboutSection(l10n: l10n),
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                ],
              ),
            ),

            // ── Bottom Nav ────────────────────────────────────────────
            const BottomNavPokemonWidget(),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Header del perfil
// ─────────────────────────────────────────────────────────────────────────────
class _ProfileHeader extends StatelessWidget {
  final TrainerProfile profile;
  final int trainerLevel;
  final AppLocalizations l10n;
  final String genderLabel;
  final VoidCallback onEditName;
  final VoidCallback onEditAvatar;
  final VoidCallback onLogout;

  const _ProfileHeader({
    required this.profile,
    required this.trainerLevel,
    required this.l10n,
    required this.genderLabel,
    required this.onEditName,
    required this.onEditAvatar,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFCC0000), Color(0xFF8B0000)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
      ),
      child: Column(
        children: [
          // Barra superior: título · editar · cerrar sesión
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.profileTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    tooltip: l10n.profileEditName,
                    onPressed: onEditName,
                    icon: const Icon(Icons.edit_rounded,
                        color: Colors.white70, size: 22),
                  ),
                  IconButton(
                    tooltip: l10n.authLogout,
                    onPressed: onLogout,
                    icon: const Icon(Icons.logout_rounded,
                        color: Colors.white70, size: 22),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Avatar
          ProfileAvatarWidget(
            assetPath: profile.avatarAsset,
            level: trainerLevel,
            size: 100,
            onTap: onEditAvatar,
          ),
          const SizedBox(height: 16),

          // Nombre
          Text(
            profile.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 4),

          // Chip tipo entrenador/entrenadora
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              genderLabel,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Sección de estadísticas
// ─────────────────────────────────────────────────────────────────────────────
class _StatsSection extends StatelessWidget {
  final int viewed;
  final int favorites;
  final int level;
  final AppLocalizations l10n;

  const _StatsSection({
    required this.viewed,
    required this.favorites,
    required this.level,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Row(
        children: [
          ProfileStatCardWidget(
            key: const Key('stat_viewed'),
            icon: Icons.visibility_rounded,
            value: '$viewed',
            label: l10n.profileStatViewed,
            accent: const Color(0xFF6390F0),
          ),
          const SizedBox(width: 10),
          ProfileStatCardWidget(
            key: const Key('stat_favorites'),
            icon: Icons.favorite_rounded,
            value: '$favorites',
            label: l10n.profileStatFavorites,
            accent: const Color(0xFFCC0000),
          ),
          const SizedBox(width: 10),
          ProfileStatCardWidget(
            key: const Key('stat_level'),
            icon: Icons.military_tech_rounded,
            value: '$level',
            label: l10n.profileStatLevel,
            accent: const Color(0xFFF7D02C),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Tipo favorito
// ─────────────────────────────────────────────────────────────────────────────
class _FavoriteTypeSection extends StatelessWidget {
  final String? typeName;
  final AppLocalizations l10n;

  const _FavoriteTypeSection({required this.typeName, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(title: l10n.profileFavoriteTypeLabel),
          const SizedBox(height: 12),
          if (typeName != null)
            ProfileFavoriteTypeWidget(typeName: typeName)
          else
            Text(
              l10n.profileFavoriteTypeNone,
              style: const TextStyle(fontSize: 13, color: Colors.black45),
            ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Logros
// ─────────────────────────────────────────────────────────────────────────────
class _AchievementsSection extends StatelessWidget {
  final int viewed;
  final int favorites;
  final AppLocalizations l10n;

  const _AchievementsSection({
    required this.viewed,
    required this.favorites,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(title: l10n.profileAchievementsTitle),
          const SizedBox(height: 12),
          ProfileAchievementItemWidget(
            icon: Icons.catching_pokemon,
            iconColor: const Color(0xFF7AC74C),
            title: l10n.profileAchFirstSteps,
            subtitle: l10n.profileAchFirstStepsSub,
            unlocked: viewed >= 1,
          ),
          ProfileAchievementItemWidget(
            icon: Icons.explore_rounded,
            iconColor: const Color(0xFF6390F0),
            title: l10n.profileAchExplorer,
            subtitle: l10n.profileAchExplorerSub,
            unlocked: viewed >= 10,
          ),
          ProfileAchievementItemWidget(
            icon: Icons.favorite_rounded,
            iconColor: const Color(0xFFCC0000),
            title: l10n.profileAchCollector,
            subtitle: l10n.profileAchCollectorSub,
            unlocked: favorites >= 5,
          ),
          ProfileAchievementItemWidget(
            icon: Icons.military_tech_rounded,
            iconColor: const Color(0xFFF7D02C),
            title: l10n.profileAchMaster,
            subtitle: l10n.profileAchMasterSub,
            unlocked: viewed >= 50,
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Acerca de
// ─────────────────────────────────────────────────────────────────────────────
class _AboutSection extends StatelessWidget {
  final AppLocalizations l10n;
  const _AboutSection({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(title: l10n.profileAboutTitle),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              children: [
                _AboutRow(
                    icon: Icons.info_outline_rounded,
                    label: l10n.profileAboutVersion),
                const Divider(height: 16),
                _AboutRow(
                    icon: Icons.api_rounded, label: l10n.profileAboutData),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutRow extends StatelessWidget {
  final IconData icon;
  final String label;
  const _AboutRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.black45),
        const SizedBox(width: 10),
        Expanded(
            child: Text(label,
                style:
                    const TextStyle(fontSize: 13, color: Colors.black87))),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Título de sección
// ─────────────────────────────────────────────────────────────────────────────
class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: Color(0xFF1D1D1D),
        letterSpacing: 0.2,
      ),
    );
  }
}

