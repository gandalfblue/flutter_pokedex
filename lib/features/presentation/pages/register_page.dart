import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../providers/auth_provider.dart';
import '../widgets/auth_form_widgets.dart';
import '../widgets/bottom_nav_pokemon_widget.dart';
import '../widgets/password_strength_indicator_widget.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  TrainerGender _gender = TrainerGender.trainer;
  String? _errorMessage;
  String _passwordValue = '';

  @override
  void initState() {
    super.initState();
    _passwordCtrl.addListener(
        () => setState(() => _passwordValue = _passwordCtrl.text));
  }

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  void _submit(AppLocalizations l10n) {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _errorMessage = null);

    if (_passwordCtrl.text != _confirmCtrl.text) {
      setState(() => _errorMessage = l10n.registerErrorPasswordMismatch);
      return;
    }

    final error = ref.read(authNotifierProvider.notifier).register(
          username: _usernameCtrl.text,
          email: _emailCtrl.text,
          password: _passwordCtrl.text,
          gender: _gender,
          l10n: l10n,
        );

    if (error != null) {
      setState(() => _errorMessage = error);
    } else {
      // Registro exitoso → logout automático y llevar al login
      ref.read(authNotifierProvider.notifier).logout();
      context.go(AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: Column(
          children: [
            // ── Contenido scrolleable ───────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // ── Header ──────────────────────────────────────────
                    _RegisterHeader(l10n: l10n),

                    // ── Formulario ──────────────────────────────────────
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Error global
                      if (_errorMessage != null)
                        AuthErrorBanner(message: _errorMessage!),

                      // Nombre de usuario
                      AuthTextField(
                        controller: _usernameCtrl,
                        hint: l10n.registerUsernameHint,
                        icon: Icons.person_outline_rounded,
                        validator: (v) => (v == null || v.trim().isEmpty)
                            ? 'El nombre de usuario es requerido.'
                            : null,
                      ),
                      const SizedBox(height: 14),

                      // Correo
                      AuthTextField(
                        controller: _emailCtrl,
                        hint: l10n.registerEmailHint,
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) {
                            return 'El correo es requerido.';
                          }
                          if (!RegExp(r'^[\w.\-]+@[\w\-]+\.[a-zA-Z]{2,}$')
                              .hasMatch(v.trim())) {
                            return 'Ingresa un correo válido.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),

                      // Contraseña
                      AuthTextField(
                        controller: _passwordCtrl,
                        hint: l10n.registerPasswordHint,
                        icon: Icons.lock_outline_rounded,
                        obscure: _obscurePassword,
                        suffixIcon: IconButton(
                          icon: Icon(_obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                          onPressed: () => setState(
                              () => _obscurePassword = !_obscurePassword),
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'La contraseña es requerida.';
                          }
                          if (!AuthNotifier.validatePassword(v)) {
                            return l10n.registerPasswordHint2;
                          }
                          return null;
                        },
                      ),

                      // Indicador de fortaleza
                      PasswordStrengthIndicatorWidget(password: _passwordValue),
                      const SizedBox(height: 14),

                      // Confirmar contraseña
                      AuthTextField(
                        controller: _confirmCtrl,
                        hint: l10n.registerConfirmPasswordHint,
                        icon: Icons.lock_outline_rounded,
                        obscure: _obscureConfirm,
                        suffixIcon: IconButton(
                          icon: Icon(_obscureConfirm
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                          onPressed: () => setState(
                              () => _obscureConfirm = !_obscureConfirm),
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Confirma tu contraseña.';
                          }
                          if (v != _passwordCtrl.text) {
                            return l10n.registerErrorPasswordMismatch;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Selección de género
                      _GenderSelector(
                        selected: _gender,
                        l10n: l10n,
                        onChanged: (g) => setState(() => _gender = g),
                      ),
                      const SizedBox(height: 28),

                      // Botón registro
                      AuthSubmitButton(
                        label: l10n.registerButton,
                        onPressed: () => _submit(l10n),
                      ),
                      const SizedBox(height: 20),

                      // Enlace a login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(l10n.registerHaveAccount,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black54)),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () => context.go(AppRoutes.login),
                            child: Text(
                              l10n.registerLoginLink,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFCC0000),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
                  ],
                ),
              ),
            ),

            // ── Bottom nav (índice 3 = Perfil activo) ──────────────────
            const BottomNavPokemonWidget(),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Header del registro
// ─────────────────────────────────────────────────────────────────────────────
class _RegisterHeader extends StatelessWidget {
  final AppLocalizations l10n;
  const _RegisterHeader({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 36, 24, 32),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFCC0000), Color(0xFF8B0000)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(36)),
      ),
      child: Column(
        children: [
          Container(
            width: 82,
            height: 82,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.15),
              border: Border.all(
                  color: Colors.white.withValues(alpha: 0.4), width: 3),
            ),
            child:
                const Icon(Icons.person_add_rounded, size: 44, color: Colors.white),
          ),
          const SizedBox(height: 18),
          Text(l10n.registerTitle,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w900)),
          const SizedBox(height: 5),
          Text(l10n.registerSubtitle,
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8), fontSize: 14)),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Selector de género (entrenador / entrenadora)
// ─────────────────────────────────────────────────────────────────────────────
class _GenderSelector extends StatelessWidget {
  final TrainerGender selected;
  final AppLocalizations l10n;
  final ValueChanged<TrainerGender> onChanged;

  const _GenderSelector({
    required this.selected,
    required this.l10n,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.registerGenderTitle,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1D1D1D))),
        const SizedBox(height: 12),
        Row(
          children: [
            _GenderCard(
              asset: 'assets/images/entrenador.png',
              label: l10n.registerGenderTrainer,
              isSelected: selected == TrainerGender.trainer,
              onTap: () => onChanged(TrainerGender.trainer),
            ),
            const SizedBox(width: 14),
            _GenderCard(
              asset: 'assets/images/entrenadora.png',
              label: l10n.registerGenderTrainerFemale,
              isSelected: selected == TrainerGender.trainerFemale,
              onTap: () => onChanged(TrainerGender.trainerFemale),
            ),
          ],
        ),
      ],
    );
  }
}

class _GenderCard extends StatelessWidget {
  final String asset;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenderCard({
    required this.asset,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFFCC0000).withValues(alpha: 0.08)
                : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFFCC0000)
                  : Colors.grey.shade200,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade100,
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFFCC0000).withValues(alpha: 0.4)
                        : Colors.grey.shade200,
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Image.asset(
                      asset,
                      width: 68,
                      height: 68,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.person_rounded,
                        size: 40,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: isSelected
                      ? const Color(0xFFCC0000)
                      : Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? const Color(0xFFCC0000)
                      : Colors.transparent,
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFFCC0000)
                        : Colors.grey.shade400,
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? const Icon(Icons.check_rounded,
                        size: 14, color: Colors.white)
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

