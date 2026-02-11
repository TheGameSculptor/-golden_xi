import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:golden_xi/core/theme/app_theme.dart';

class StaffDashboardView extends StatelessWidget {
  const StaffDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatsRow(),
          const SizedBox(height: 40),
          _buildSectionTitle('MI EQUIPO', 'Ver Plantilla'),
          const SizedBox(height: 16),
          _buildTeamHero(),
          const SizedBox(height: 40),
          _buildSectionTitle('TAREAS PENDIENTES', null),
          const SizedBox(height: 16),
          _buildTasksList(),
          const SizedBox(height: 40),
          _buildSectionTitle('TORNEOS', 'Ver Todos'),
          const SizedBox(height: 16),
          _buildTournamentsCarousel(),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        Expanded(child: _buildStatItem('Ratio Victoria', '72%', Colors.green)),
        const SizedBox(width: 12),
        Expanded(child: _buildStatItem('Moral', 'Alta', AppTheme.primaryGold)),
        const SizedBox(width: 12),
        Expanded(child: _buildStatItem('Presupuesto', '\$1.2M', Colors.white)),
      ],
    );
  }

  Widget _buildStatItem(String label, String value, Color valueColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(color: AppTheme.surfaceDark, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Text(label, style: GoogleFonts.lexend(fontSize: 10, color: Colors.white38)),
          const SizedBox(height: 4),
          Text(value, style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold, color: valueColor)),
        ],
      ),
    );
  }

  Widget _buildTeamHero() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.primaryGold.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: Colors.green.withOpacity(0.2), borderRadius: BorderRadius.circular(8)), child: Text('Listo Para Partido', style: GoogleFonts.lexend(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.green))),
              Text('En 2h 30m', style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primaryGold)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Golden XI', style: GoogleFonts.lexend(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.white)),
              const SizedBox(width: 8),
              Text('vs', style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white38, fontStyle: FontStyle.italic)),
              const SizedBox(width: 8),
              Text('Titans', style: GoogleFonts.lexend(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.white)),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryGold, foregroundColor: Colors.black, minimumSize: const Size(double.infinity, 50)),
            child: const Text('Gestionar Alineación'),
          ),
        ],
      ),
    );
  }

  Widget _buildTasksList() {
    return Column(
      children: [
        _buildTaskItem(Icons.badge, 'Renovación Contrato', 'Revisar términos de M. Johnson'),
        const SizedBox(height: 12),
        _buildTaskItem(Icons.medical_services, 'Informe de Lesiones', 'Aprobar plan de rehabilitación'),
      ],
    );
  }

  Widget _buildTaskItem(IconData icon, String title, String sub) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppTheme.surfaceDark, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.white.withOpacity(0.05))),
      child: Row(
        children: [
          Container(width: 44, height: 44, decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), shape: BoxShape.circle), child: Icon(icon, color: AppTheme.primaryGold, size: 20)),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)), Text(sub, style: GoogleFonts.lexend(fontSize: 11, color: Colors.white38))])),
          const Icon(Icons.chevron_right, color: Colors.white24),
        ],
      ),
    );
  }

  Widget _buildTournamentsCarousel() {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildTournamentCard('FINALES REGIONALES', 'Liga de Verano', '24 - 26 Ago'),
          const SizedBox(width: 16),
          _buildTournamentCard('COPA BENÉFICA', 'Comunidad', '10 Sep'),
        ],
      ),
    );
  }

  Widget _buildTournamentCard(String tag, String title, String date) {
    return Container(
      width: 200,
      decoration: BoxDecoration(color: AppTheme.surfaceDark, borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tag, style: GoogleFonts.lexend(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.primaryGold)),
          Text(title, style: GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          const Spacer(),
          Text(date, style: GoogleFonts.lexend(fontSize: 10, color: Colors.white38)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String text, String? action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.2)),
        if (action != null) Text(action, style: GoogleFonts.lexend(fontSize: 12, color: AppTheme.primaryGold)),
      ],
    );
  }
}
