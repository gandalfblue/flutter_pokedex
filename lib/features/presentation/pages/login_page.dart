import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../providers/auth_provider.dart';
import '../widgets/auth_form_widgets.dart';
import '../widgets/bottom_nav_pokemon_widget.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscurePassword = true;
  String? _errorMessage;

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _errorMessage = null);

    final l10n = AppLocalizations.of(context)!;
    final error = ref.read(authNotifierProvider.notifier).login(
          username: _usernameCtrl.text,
          password: _passwordCtrl.text,
          l10n: l10n,
        );

    if (error != null) {
      setState(() => _errorMessage = error);
    } else {
      // Login exitoso → ir al perfil
      context.go(AppRoutes.profile);
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
            // ── Contenido scrolleable ─────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // ── Header ────────────────────────────────────────
                    _LoginHeader(l10n: l10n),

                    // ── Formulario ────────────────────────────────────
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (_errorMessage != null)
                              AuthErrorBanner(message: _errorMessage!),

                            AuthTextField(
                              controller: _usernameCtrl,
                              hint: l10n.loginUsernameHint,
                              icon: Icons.person_outline_rounded,
                              validator: (v) =>
                                  (v == null || v.trim().isEmpty)
                                      ? l10n.loginErrorEmpty
                                      : null,
                            ),
                            const SizedBox(height: 16),

                            AuthTextField(
                              controller: _passwordCtrl,
                              hint: l10n.loginPasswordHint,
                              icon: Icons.lock_outline_rounded,
                              obscure: _obscurePassword,
                              suffixIcon: IconButton(
                                icon: Icon(_obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined),
                                onPressed: () => setState(() =>
                                    _obscurePassword = !_obscurePassword),
                              ),
                              validator: (v) =>
                                  (v == null || v.isEmpty)
                                      ? l10n.loginErrorEmpty
                                      : null,
                            ),
                            const SizedBox(height: 32),

                            AuthSubmitButton(
                              label: l10n.loginButton,
                              onPressed: _submit,
                            ),
                            const SizedBox(height: 20),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(l10n.loginNoAccount,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54)),
                                const SizedBox(width: 4),
                                GestureDetector(
                                  onTap: () =>
                                      context.go(AppRoutes.register),
                                  child: Text(
                                    l10n.loginRegisterLink,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFCC0000),
                                      decoration:
                                          TextDecoration.underline,
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

            // ── Bottom nav (índice 3 = Perfil activo) ─────────────────
            const BottomNavPokemonWidget(),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Header con pokébola decorativa
// ─────────────────────────────────────────────────────────────────────────────
class _LoginHeader extends StatelessWidget {
  final AppLocalizations l10n;
  const _LoginHeader({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 36),
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
          // Pokébola decorativa
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.15),
              border: Border.all(
                  color: Colors.white.withValues(alpha: 0.4), width: 3),
            ),
            child: const Icon(Icons.catching_pokemon,
                size: 52, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Text(
            l10n.loginTitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            l10n.loginSubtitle,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

