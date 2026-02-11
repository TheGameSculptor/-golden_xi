import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:golden_xi/core/theme/app_theme.dart';
import 'package:golden_xi/routes/app_routes.dart';

class StaffTechnicalDashboard extends StatelessWidget {
  const StaffTechnicalDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      body: Stack(
        children: [
            // Safe Area content
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 100), // Space for bottom nav
                child: Column(
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors: [AppTheme.primaryGold, Colors.yellow[700]!]),
                              boxShadow: [BoxShadow(color: AppTheme.primaryGold.withOpacity(0.2), blurRadius: 10)],
                            ),
                            child: CircleAvatar(
                              backgroundColor: AppTheme.backgroundDark,
                              child: const Icon(Icons.shield, color: AppTheme.primaryGold),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'STAFF TÉCNICO',
                                style: GoogleFonts.lexend(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryGold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const Text(
                                'Golden XI F.C.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              color: AppTheme.surfaceDark,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white10),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.notifications, color: Colors.white),
                              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sin notificaciones'))),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Próximo Rival Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PRÓXIMO RIVAL',
                            style: GoogleFonts.lexend(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500],
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppTheme.surfaceDark,
                                  Colors.black,
                                ],
                              ),
                              border: Border.all(color: AppTheme.primaryGold.withOpacity(0.3)),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: -20,
                                  right: -20,
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: AppTheme.primaryGold.withOpacity(0.1),
                                      shape: BoxShape.circle,
                                      boxShadow: [BoxShadow(color: AppTheme.primaryGold.withOpacity(0.1), blurRadius: 50)],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          _buildTeamColumn('GXI F.C.', Icons.shield, AppTheme.primaryGold),
                                          Column(
                                            children: [
                                              Text(
                                                'VS',
                                                style: GoogleFonts.lexend(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 24,
                                                  color: AppTheme.primaryGold,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: AppTheme.primaryGold.withOpacity(0.1),
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                child: Text(
                                                  '24 OCT',
                                                  style: TextStyle(
                                                    color: AppTheme.primaryGold,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          _buildTeamColumn('Titanes UD', Icons.sports_soccer, Colors.grey),
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton.icon(
                                          onPressed: () {
                                             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Analizando rival...')));
                                          },
                                          icon: const Icon(Icons.analytics, size: 18),
                                          label: const Text('ANALIZAR'),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppTheme.primaryGold,
                                            foregroundColor: Colors.black,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                            padding: const EdgeInsets.symmetric(vertical: 12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Stats Grid
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          Expanded(child: _buildStatCard(Icons.group, 'Plantilla', '18/22')),
                          const SizedBox(width: 12),
                          Expanded(child: _buildStatCard(Icons.monitor_heart, 'Forma', '84%')),
                          const SizedBox(width: 12),
                          Expanded(child: _buildStatCard(Icons.calendar_today, 'Días', 'D-3', isHighlight: true)),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Quick Actions
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ACCIONES RÁPIDAS',
                            style: GoogleFonts.lexend(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500],
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          GestureDetector(
                            onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pasando lista...'))),
                            child: _buildActionTile(Icons.format_list_bulleted, 'Pasar Lista Entreno', 'Sesión 18:00h • Campo 3'),
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, AppRoutes.staffHome),
                            child: _buildActionTile(Icons.draw, 'Editar Alineación', '4-3-3 Ofensiva • Táctica'),
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Notificación enviada'))),
                            child: _buildActionTile(Icons.send, 'Enviar Notificación', 'Comunicar a toda la plantilla'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Bottom Nav
             Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                decoration: BoxDecoration(
                  color: AppTheme.backgroundDark.withOpacity(0.9),
                  border: const Border(top: BorderSide(color: Colors.white10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildNavIcon(Icons.emoji_events, 'Torneos', onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Torneos próximamente')))),
                    _buildNavIcon(Icons.forum, 'Social', onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Social próximamente')))),
                    _buildNavIcon(Icons.dashboard, 'Mi Equipo', isActive: true, onTap: () {}),
                    _buildNavIcon(Icons.person, 'Perfil', onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Perfil próximamente')))),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTeamColumn(String name, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white10),
          ),
          child: Icon(icon, color: color, size: 30),
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13)),
      ],
    );
  }

  Widget _buildStatCard(IconData icon, String label, String value, {bool isHighlight = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppTheme.primaryGold, size: 24),
          const SizedBox(height: 8),
          Text(
            label.toUpperCase(),
            style: GoogleFonts.lexend(fontSize: 10, color: Colors.grey[500], fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.lexend(
              fontSize: 18, 
              fontWeight: FontWeight.bold,
              color: isHighlight ? AppTheme.primaryGold : Colors.white
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppTheme.primaryGold.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppTheme.primaryGold),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                Text(subtitle, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey[600]),
        ],
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, String label, {bool isActive = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isActive ? AppTheme.primaryGold : Colors.grey[600]),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? AppTheme.primaryGold : Colors.grey[600],
              fontSize: 10,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
