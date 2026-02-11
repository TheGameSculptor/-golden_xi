import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:golden_xi/core/theme/app_theme.dart';

class AccessHelpScreen extends StatefulWidget {
  const AccessHelpScreen({super.key});

  @override
  State<AccessHelpScreen> createState() => _AccessHelpScreenState();
}

class _AccessHelpScreenState extends State<AccessHelpScreen> {
  String _recoveryType = 'password'; // 'password' or 'email'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                   IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: AppTheme.primaryGold),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryGold.withOpacity(0.2),
                      shape: BoxShape.circle,
                      border: Border.all(color: AppTheme.primaryGold.withOpacity(0.3)),
                    ),
                    child: const Icon(Icons.security, color: AppTheme.primaryGold, size: 16),
                  ),
                  const Spacer(flex: 2), // Aesthetic centering
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    // Title
                    Text.rich(
                      TextSpan(
                        text: '¿TIENES PROBLEMAS \n',
                        style: GoogleFonts.lexend(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          height: 1.1,
                        ),
                        children: [
                          TextSpan(
                            text: 'PARA ACCEDER?',
                            style: TextStyle(color: AppTheme.primaryGold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Selecciona el tipo de recuperación que necesitas para volver al campo de juego.',
                      style: GoogleFonts.lexend(
                        color: Colors.grey[400],
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Recovery Options
                    _buildRecoveryOption(
                      value: 'password',
                      title: 'He olvidado mi contraseña',
                      subtitle: 'Recupera el acceso mediante tu email',
                      icon: Icons.vpn_key,
                    ),
                    const SizedBox(height: 16),
                    _buildRecoveryOption(
                      value: 'email',
                      title: 'He olvidado mi correo',
                      subtitle: 'Valida tu identidad con DNI o CIF',
                      icon: Icons.alternate_email,
                    ),

                    const SizedBox(height: 40),

                    // Dynamic Fields
                    if (_recoveryType == 'password')
                      _buildTextField(
                        label: 'EMAIL DE REGISTRO',
                        icon: Icons.email,
                        placeholder: 'ejemplo@club.com',
                        inputType: TextInputType.emailAddress,
                      )
                    else ...[
                      _buildTextField(
                        label: 'DNI DEL ADMINISTRADOR O CIF DEL CLUB',
                        icon: Icons.badge,
                        placeholder: '12345678X',
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                        label: 'NÚMERO DE TELÉFONO',
                        icon: Icons.phone_iphone,
                        placeholder: '+34 000 000 000',
                        inputType: TextInputType.phone,
                      ),
                    ],

                    const SizedBox(height: 32),

                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Solicitud no enviada: Funcionalidad Demo')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryGold,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 8,
                          shadowColor: AppTheme.primaryGold.withOpacity(0.4),
                        ),
                        child: Text(
                          'SOLICITAR AYUDA',
                          style: GoogleFonts.lexend(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 48),

                    // Footer
                    Center(
                      child: Column(
                        children: [
                          Text(
                            '¿Sigues sin poder entrar?',
                            style: GoogleFonts.lexend(color: Colors.grey[500], fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          TextButton.icon(
                            onPressed: () {
                               ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Abriendo soporte técnico...')),
                              );
                            },
                            icon: const Icon(Icons.support_agent, color: AppTheme.primaryGold),
                            label: Text(
                              'Contactar con Soporte Técnico',
                              style: GoogleFonts.lexend(
                                color: AppTheme.primaryGold,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: AppTheme.primaryGold.withOpacity(0.5)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecoveryOption({
    required String value,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    final isSelected = _recoveryType == value;
    return GestureDetector(
      onTap: () => setState(() => _recoveryType = value),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryGold.withOpacity(0.1) : AppTheme.primaryGold.withOpacity(0.05),
          border: Border.all(
            color: isSelected ? AppTheme.primaryGold : AppTheme.primaryGold.withOpacity(0.2),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: isSelected
              ? [BoxShadow(color: AppTheme.primaryGold.withOpacity(0.2), blurRadius: 15)]
              : [],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppTheme.primaryGold.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: AppTheme.primaryGold, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.lexend(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.lexend(
                      color: Colors.grey[500],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: AppTheme.primaryGold),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required String placeholder,
    TextInputType inputType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label,
            style: GoogleFonts.lexend(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey[400],
              letterSpacing: 1,
            ),
          ),
        ),
        TextFormField(
          keyboardType: inputType,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF1A1A1A),
            prefixIcon: Icon(icon, color: AppTheme.primaryGold.withOpacity(0.6)),
            hintText: placeholder,
            hintStyle: TextStyle(color: Colors.grey[600]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppTheme.primaryGold.withOpacity(0.5), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ],
    );
  }
}
