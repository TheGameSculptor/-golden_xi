import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:golden_xi/core/theme/app_theme.dart';

class PlayerDashboardView extends StatelessWidget {
  const PlayerDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWelcomeSection(),
          const SizedBox(height: 24),
          _buildStatsOverview(),
          const SizedBox(height: 32),
          _buildNextMatchCard(),
          const SizedBox(height: 32),
          _buildQuickActions(),
          const SizedBox(height: 32),
          _buildTournamentsSection(),
        ],
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('LISTO PARA', style: GoogleFonts.lexend(fontSize: 24, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white, height: 1)),
            Text('¿EL CAMPO?', style: GoogleFonts.lexend(fontSize: 24, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: AppTheme.primaryGold, height: 1.2)),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.primaryGold.withOpacity(0.1),
            border: Border.all(color: AppTheme.primaryGold.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text('RANGO #42', style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primaryGold)),
        ),
      ],
    );
  }

  Widget _buildStatsOverview() {
    return Row(
      children: [
        Expanded(child: _buildStatItem('Victorias', '68%', false)),
        const SizedBox(width: 12),
        Expanded(child: _buildStatItem('MMR', '2,450', true)),
        const SizedBox(width: 12),
        Expanded(child: _buildStatItem('Partidas', '142', false)),
      ],
    );
  }

  Widget _buildStatItem(String label, String value, bool highlight) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2618).withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: highlight ? AppTheme.primaryGold.withOpacity(0.4) : AppTheme.primaryGold.withOpacity(0.15)),
        boxShadow: highlight ? [BoxShadow(color: AppTheme.primaryGold.withOpacity(0.15), blurRadius: 15)] : null,
      ),
      child: Column(
        children: [
          Text(label.toUpperCase(), style: GoogleFonts.lexend(fontSize: 10, color: highlight ? AppTheme.primaryGold : Colors.grey, fontWeight: FontWeight.w600, letterSpacing: 1)),
          const SizedBox(height: 4),
          Text(value, style: GoogleFonts.lexend(fontSize: 20, fontWeight: FontWeight.bold, color: highlight ? AppTheme.primaryGold : Colors.white)),
        ],
      ),
    );
  }

  Widget _buildNextMatchCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('NEXT MATCH', style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 2)),
            Row(
              children: [
                Container(width: 6, height: 6, decoration: const BoxDecoration(color: AppTheme.primaryGold, shape: BoxShape.circle)),
                const SizedBox(width: 6),
                Text('Check-in en Vivo', style: GoogleFonts.lexend(fontSize: 12, color: AppTheme.primaryGold)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.primaryGold),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppTheme.backgroundDark.withOpacity(0.8), AppTheme.backgroundDark],
              ),
            ),
            child: Column(
              children: [
                Text('GOLDEN XI CUP - QUARTER FINAL', style: GoogleFonts.lexend(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 2)),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildMatchTeam('GXI Elite', Icons.shield),
                    Text('VS', style: GoogleFonts.lexend(fontSize: 24, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: AppTheme.primaryGold)),
                    _buildMatchTeam('Liquid', Icons.water_drop, grayscale: true),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                  child: Text('REGISTRARSE AHORA', style: GoogleFonts.lexend(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMatchTeam(String name, IconData icon, {bool grayscale = false}) {
    return Column(
      children: [
        Container(width: 56, height: 56, decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), shape: BoxShape.circle, border: Border.all(color: Colors.white.withOpacity(0.2))), child: Icon(icon, color: grayscale ? Colors.grey : AppTheme.primaryGold, size: 32)),
        const SizedBox(height: 8),
        Text(name, style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.bold, color: grayscale ? Colors.grey : Colors.white)),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Row(
      children: [
        Expanded(child: _buildActionItem(Icons.search, 'Find Match', 'Ranked Queue')),
        const SizedBox(width: 16),
        Expanded(child: _buildActionItem(Icons.chat, 'Team Chat', '3 New Msgs')),
      ],
    );
  }

  Widget _buildActionItem(IconData icon, String label, String subLabel) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF2A2618), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white.withOpacity(0.05))),
      child: Row(
        children: [
          Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: AppTheme.primaryGold.withOpacity(0.2), shape: BoxShape.circle), child: Icon(icon, color: AppTheme.primaryGold, size: 20)),
          const SizedBox(width: 12),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)), Text(subLabel, style: GoogleFonts.lexend(fontSize: 10, color: Colors.grey))]),
        ],
      ),
    );
  }

  Widget _buildTournamentsSection() {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('OTROS TORNEOS', style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 2)), Text('Ver Todo', style: GoogleFonts.lexend(fontSize: 12, color: AppTheme.primaryGold))]),
        const SizedBox(height: 16),
        _buildTournamentCard('Enfrentamiento Semanal', 'Activo', 'Ronda 3 de 8', Colors.green),
        const SizedBox(height: 12),
        _buildTournamentCard('Liga de Verano', 'Reg Abierto', 'Inicia en 2d', Colors.orange),
      ],
    );
  }

  Widget _buildTournamentCard(String name, String status, String round, Color statusColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF2A2618).withOpacity(0.6), borderRadius: BorderRadius.circular(12), border: Border.all(color: AppTheme.primaryGold.withOpacity(0.15))),
      child: Row(
        children: [
          Container(width: 48, height: 48, decoration: BoxDecoration(color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.emoji_events, color: Colors.grey)),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(name, style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)), const SizedBox(height: 4), Row(children: [Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: statusColor.withOpacity(0.15), borderRadius: BorderRadius.circular(4), border: Border.all(color: statusColor.withOpacity(0.3))), child: Text(status, style: GoogleFonts.lexend(fontSize: 10, color: statusColor, fontWeight: FontWeight.bold))), const SizedBox(width: 8), Text(round, style: GoogleFonts.lexend(fontSize: 10, color: Colors.grey))])])),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}
