import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:golden_xi/core/theme/app_theme.dart';
import 'package:golden_xi/routes/app_routes.dart';

class OwnerProfileScreen extends StatelessWidget {
  const OwnerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header / Profile Section
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Background decorative blur
                Positioned(
                  top: -50,
                  right: -50,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryGold.withOpacity(0.1),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryGold.withOpacity(0.1),
                          blurRadius: 100,
                          spreadRadius: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 60, 24, 32),
                  child: Row(
                    children: [
                      // Avatar
                      Stack(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppTheme.primaryGold, width: 2),
                            ),
                            child: const CircleAvatar(
                              backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCprldfGmRoou4ozQnUInk27XE27pkXwREJypFcLAvaNIAl-25WWYkoiY3s2NLpHav626F8GlE4ptKckwHghExemmFp5fWkwz9WNDIkS-kKHWmgc1BQiJffXoC_BjvprBE1odVkpu1Lhs9Wko1jQ2lw_8ZXhzYTpEtMWT0LAoVR_RZyn_Gn1yeUIt7Eqsu1uGn7_7a17oecwyGSo1fg-HY3kEWMHTPpJh3OSsoB3MjRPGn40rDtqCNaCdEWkDepcDFYTTdCvK-NnQ'),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppTheme.backgroundDark,
                                shape: BoxShape.circle,
                                border: Border.all(color: AppTheme.primaryGold.withOpacity(0.3)),
                              ),
                              child: const Icon(Icons.shield, size: 14, color: AppTheme.primaryGold), 
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      // Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Alejandro Ferrán',
                              style: GoogleFonts.manrope(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                height: 1.1,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  'PRESIDENTE',
                                  style: GoogleFonts.manrope(
                                    color: AppTheme.primaryGold,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                                Text(
                                  ' • GOLDEN XI CLUB',
                                  style: GoogleFonts.manrope(
                                    color: AppTheme.primaryGold.withOpacity(0.5),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Edit Button
                      Container(
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceDark,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white.withOpacity(0.05)),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.edit, color: Colors.white70),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Current Subscription
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppTheme.surfaceDark,
                      const Color(0xFF121212),
                    ],
                  ),
                  border: Border.all(color: Colors.white.withOpacity(0.05)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Icon(Icons.verified, size: 60, color: Colors.white.withOpacity(0.05)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TU SUSCRIPCIÓN ACTUAL',
                            style: GoogleFonts.manrope(
                              color: Colors.white60,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                'Plan ',
                                style: GoogleFonts.manrope(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'PRO',
                                style: GoogleFonts.manrope(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryGold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Activa hasta Dic 2024',
                                style: GoogleFonts.manrope(
                                  color: Colors.white38,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.primaryGold,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              child: Text(
                                'MEJORAR PLAN',
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Subscription Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Planes Disponibles',
                    style: GoogleFonts.manrope(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'FACTURACIÓN ANUAL',
                    style: GoogleFonts.manrope(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white38,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Row(
                children: [
                  // BASIC
                  _buildPlanCard(
                    title: 'BASIC',
                    subtitle: 'PLATA',
                    price: '0€',
                    features: ['Hasta 2 equipos', 'Gestión básica', 'Analíticas IA'],
                    featuresEnabled: [true, true, false],
                    isCurrent: true,
                    isRecommended: false,
                    isElite: false,
                  ),
                  const SizedBox(width: 16),
                  // PRO
                  _buildPlanCard(
                    title: 'PRO',
                    subtitle: 'ORO',
                    price: '199€',
                    features: ['Hasta 10 equipos', 'Almacenamiento 50GB', 'Informes Mensuales'],
                    featuresEnabled: [true, true, true],
                    isCurrent: false,
                    isRecommended: true,
                    isElite: false,
                  ),
                  const SizedBox(width: 16),
                  // ELITE
                  _buildPlanCard(
                    title: 'GOLD',
                    subtitle: 'ELITE',
                    price: '499€',
                    features: ['Equipos ilimitados', 'Analíticas Avanzadas IA', 'Soporte Concierge 24/7'],
                    featuresEnabled: [true, true, true],
                    isCurrent: false,
                    isRecommended: false,
                    isElite: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Settings
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Configuración',
                    style: GoogleFonts.manrope(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceDark.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.05)),
                    ),
                    child: Column(
                      children: [
                        _buildSettingsTile(context, Icons.person_outline, 'Editar Perfil del Dueño'),
                        Divider(height: 1, color: Colors.white.withOpacity(0.05)),
                        _buildSettingsTile(context, Icons.credit_card, 'Métodos de Pago'),
                         Divider(height: 1, color: Colors.white.withOpacity(0.05)),
                        _buildSettingsTile(context, Icons.receipt_long, 'Historial de Facturas'),
                         Divider(height: 1, color: Colors.white.withOpacity(0.05)),
                        _buildSettingsTile(context, Icons.security, 'Seguridad y Privacidad'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Logout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: OutlinedButton.icon(
                onPressed: () {
                   Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (route) => false);
                },
                icon: const Icon(Icons.logout),
                label: const Text('CERRAR SESIÓN'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red[400],
                  side: BorderSide(color: Colors.red.withOpacity(0.2)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  minimumSize: const Size(double.infinity, 0),
                  textStyle: GoogleFonts.manrope(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String subtitle,
    required String price,
    required List<String> features,
    required List<bool> featuresEnabled,
    bool isCurrent = false,
    bool isRecommended = false,
    bool isElite = false,
  }) {
    final cardColor = isElite ? null : AppTheme.surfaceDark;
    final textColor = isElite ? AppTheme.backgroundDark : Colors.white;
    final subTextColor = isElite ? AppTheme.backgroundDark.withOpacity(0.6) : Colors.white54;
    final iconColor = isElite ? AppTheme.backgroundDark : (isRecommended ? AppTheme.primaryGold : Colors.grey);
    
    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (isRecommended)
          Positioned(
            top: -12,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.primaryGold,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'RECOMENDADO',
                  style: GoogleFonts.manrope(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.backgroundDark,
                  ),
                ),
              ),
            ),
          ),
        Container(
          width: 260,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: cardColor,
            gradient: isElite 
                ? const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFc29e29), Color(0xFFD4AF37), Color(0xFFf1d279)]) 
                : null,
            borderRadius: BorderRadius.circular(20),
            border: isRecommended 
                ? Border.all(color: AppTheme.primaryGold.withOpacity(0.5), width: 2) 
                : Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subtitle,
                        style: GoogleFonts.manrope(
                          color: isElite ? AppTheme.backgroundDark.withOpacity(0.6) : (isRecommended ? AppTheme.primaryGold : Colors.grey),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Text(
                        title,
                        style: GoogleFonts.manrope(
                          color: textColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    isElite ? Icons.diamond : (isRecommended ? Icons.stars : Icons.workspace_premium),
                    color: iconColor,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: price,
                      style: GoogleFonts.manrope(
                        color: textColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '/año',
                      style: GoogleFonts.manrope(
                        color: subTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ...List.generate(features.length, (index) {
                final enabled = featuresEnabled[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Icon(
                        enabled 
                          ? Icons.check_circle 
                          : Icons.cancel,
                        size: 16,
                        color: enabled ? iconColor : subTextColor.withOpacity(0.3),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        features[index],
                        style: GoogleFonts.manrope(
                          color: enabled ? textColor.withOpacity(0.7) : subTextColor.withOpacity(0.4),
                          fontSize: 13,
                          decoration: enabled ? null : TextDecoration.lineThrough,
                          decorationColor: subTextColor.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 16),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isElite 
                          ? AppTheme.backgroundDark 
                          : (isRecommended ? AppTheme.primaryGold.withOpacity(0.2) : Colors.transparent),
                      foregroundColor: isElite 
                          ? AppTheme.primaryGold 
                          : (isRecommended ? AppTheme.primaryGold : Colors.white),
                      elevation: 0,
                      side: isCurrent 
                          ? BorderSide(color: Colors.white.withOpacity(0.2)) 
                          : (isRecommended ? BorderSide(color: AppTheme.primaryGold.withOpacity(0.2)) : BorderSide(color: Colors.white.withOpacity(0.1))),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      isCurrent ? 'PLAN ACTUAL' : (isRecommended ? 'SELECCIONADO' : 'CONTRATAR'),
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsTile(BuildContext context, IconData icon, String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Icon(icon, color: AppTheme.primaryGold.withOpacity(0.7)),
      title: Text(
        title,
        style: GoogleFonts.manrope(
          color: Colors.white.withOpacity(0.9),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.white.withOpacity(0.2)),
      onTap: () {
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title próximamente')));
      },
    );
  }
}
