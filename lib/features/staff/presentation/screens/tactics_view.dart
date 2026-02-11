import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:golden_xi/core/theme/app_theme.dart';

class TacticsView extends StatelessWidget {
  const TacticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 120),
          child: Column(
            children: [
              _buildTacticalPitch(),
              const SizedBox(height: 32),
              _buildSubsSection(),
            ],
          ),
        ),
        _buildBottomActions(),
      ],
    );
  }

  Widget _buildTacticalPitch() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: double.infinity,
      height: 450,
      decoration: BoxDecoration(
        gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF2A2618), AppTheme.backgroundDark]),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.primaryGold.withOpacity(0.2)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 40)],
      ),
      child: Stack(
        children: [
          _buildPitchLines(),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPlayerRow([_buildPlayer('11', 'Vinícius'), _buildPlayer('9', 'Mbappé'), _buildPlayer('7', 'Rodrygo')]),
                _buildPlayerRow([_buildPlayer('5', 'Bellingham'), _buildPlayer('8', 'Valverde'), _buildPlayer('14', 'Tchouaméni')]),
                _buildPlayerRow([_buildPlayer('23', 'Mendy'), _buildPlayer('22', 'Rüdiger'), _buildPlayer('3', 'Militão'), _buildPlayer('2', 'Carvajal')]),
                _buildPlayer('1', 'Courtois'),
              ],
            ),
          ),
          Positioned(
            bottom: 24, right: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(color: AppTheme.primaryGold, borderRadius: BorderRadius.circular(20)),
              child: Row(children: [const Icon(Icons.grid_view, color: Colors.black, size: 16), const SizedBox(width: 8), Text('4-3-3', style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black))]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPitchLines() {
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: AppTheme.primaryGold.withOpacity(0.1), width: 2), borderRadius: BorderRadius.circular(12)),
          child: Stack(
            children: [
              Align(alignment: Alignment.topCenter, child: Container(width: 150, height: 60, decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppTheme.primaryGold.withOpacity(0.1), width: 2), left: BorderSide(color: AppTheme.primaryGold.withOpacity(0.1), width: 2), right: BorderSide(color: AppTheme.primaryGold.withOpacity(0.1), width: 2))))),
              Align(alignment: Alignment.center, child: Container(height: 2, width: double.infinity, color: AppTheme.primaryGold.withOpacity(0.1))),
              Align(alignment: Alignment.center, child: Container(width: 100, height: 100, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppTheme.primaryGold.withOpacity(0.1), width: 2)))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerRow(List<Widget> players) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: players);
  }

  Widget _buildPlayer(String number, String name) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(width: 44, height: 44, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppTheme.primaryGold, width: 2), boxShadow: [BoxShadow(color: AppTheme.primaryGold.withOpacity(0.3), blurRadius: 10)]), child: const CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=p'), backgroundColor: AppTheme.backgroundDark)),
            Positioned(bottom: -2, right: -2, child: Container(width: 16, height: 16, decoration: BoxDecoration(color: AppTheme.primaryGold, shape: BoxShape.circle, border: Border.all(color: AppTheme.backgroundDark, width: 1)), child: Center(child: Text(number, style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.black))))),
          ],
        ),
        const SizedBox(height: 4),
        Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), borderRadius: BorderRadius.circular(4)), child: Text(name, style: GoogleFonts.lexend(fontSize: 8, color: Colors.white, fontWeight: FontWeight.w500))),
      ],
    );
  }

  Widget _buildSubsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Jugadores Suplentes', style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)), Text('7 Disponibles', style: GoogleFonts.lexend(fontSize: 12, color: AppTheme.primaryGold))]),
          const SizedBox(height: 16),
          _buildSubCard('Luka Modric', 'MC', '87'),
          const SizedBox(height: 12),
          _buildSubCard('Brahim Díaz', 'ED', '82'),
        ],
      ),
    );
  }

  Widget _buildSubCard(String name, String pos, String rating) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: AppTheme.primaryGold.withOpacity(0.05), borderRadius: BorderRadius.circular(16), border: Border.all(color: AppTheme.primaryGold.withOpacity(0.2))),
      child: Row(
        children: [
          const CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=s')),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(name, style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)), Text('$pos • Media: $rating', style: GoogleFonts.lexend(fontSize: 10, color: AppTheme.primaryGold.withOpacity(0.8)))]))
        ],
      ),
    );
  }

  Widget _buildBottomActions() {
    return Positioned(
      bottom: 0, left: 0, right: 0,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(color: AppTheme.backgroundDark, border: Border(top: BorderSide(color: Colors.white10))),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryGold, foregroundColor: Colors.black, minimumSize: const Size(double.infinity, 56)),
          child: Text('Guardar Alineación', style: GoogleFonts.lexend(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
      ),
    );
  }
}
