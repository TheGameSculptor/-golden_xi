import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';

class PlayerProfileView extends StatelessWidget {
  const PlayerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNextMatchSection(),
          const SizedBox(height: 32),
          _buildStatsGrid(),
          const SizedBox(height: 32),
          _buildSectionTitle('RECENT RESULTS'),
          const SizedBox(height: 16),
          _buildResultItem('WIN', 'vs Titans FC', '3 - 1', Colors.green),
          const SizedBox(height: 12),
          _buildResultItem('DRAW', 'vs Madrid Lions', '2 - 2', Colors.grey),
          const SizedBox(height: 12),
          _buildResultItem('LOSS', 'vs Vikingos', '0 - 1', Colors.red),
        ],
      ),
    );
  }

  Widget _buildNextMatchSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('NEXT MATCH'),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.surfaceDark,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppTheme.primaryGold.withOpacity(0.2)),
            gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [AppTheme.surfaceDark, AppTheme.backgroundDark]),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTeamLogo('GXI', Icons.shield),
                  Column(children: [Text('VS', style: GoogleFonts.lexend(fontSize: 22, fontWeight: FontWeight.w900, color: AppTheme.primaryGold, italic: true)), Text('Tomorrow, 21:00', style: GoogleFonts.lexend(fontSize: 10, color: Colors.white38))]),
                  _buildTeamLogo('TIT', Icons.sports_soccer),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.white10),
              const SizedBox(height: 12),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [const Icon(Icons.location_on, color: AppTheme.primaryGold, size: 14), const SizedBox(width: 4), Text('Estadio Central, Madrid', style: GoogleFonts.lexend(fontSize: 12, color: Colors.white38))]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTeamLogo(String acr, IconData icon) {
    return Column(
      children: [
        Container(width: 60, height: 60, decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), shape: BoxShape.circle), child: Icon(icon, color: Colors.white, size: 30)),
        const SizedBox(height: 8),
        Text(acr, style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white70)),
      ],
    );
  }

  Widget _buildStatsGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('STATISTICS'),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildStatCard('24', 'MATCHES')),
            const SizedBox(width: 12),
            Expanded(child: _buildStatCard('18 / 6', 'GOALS/AST', highlight: true)),
            const SizedBox(width: 12),
            Expanded(child: _buildStatCard('8.2', 'RATING')),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(String val, String label, {bool highlight = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(color: AppTheme.surfaceDark, borderRadius: BorderRadius.circular(16), border: Border.all(color: highlight ? AppTheme.primaryGold.withOpacity(0.4) : Colors.white10)),
      child: Column(
        children: [
          Text(val, style: GoogleFonts.lexend(fontSize: 20, fontWeight: FontWeight.bold, color: highlight ? AppTheme.primaryGold : Colors.white)),
          Text(label, style: GoogleFonts.lexend(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.white38)),
        ],
      ),
    );
  }

  Widget _buildResultItem(String status, String opp, String score, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppTheme.surfaceDark, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.white10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(6)), child: Text(status, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold))),
              const SizedBox(width: 16),
              Text(opp, style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white)),
            ],
          ),
          Text(score, style: GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Text(text, style: GoogleFonts.lexend(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white38, letterSpacing: 2));
  }
}
