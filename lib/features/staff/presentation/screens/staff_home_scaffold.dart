import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:golden_xi/core/theme/app_theme.dart';

class StaffHomeScaffold extends StatefulWidget {
  const StaffHomeScaffold({super.key});

  @override
  State<StaffHomeScaffold> createState() => _StaffHomeScaffoldState();
}

class _StaffHomeScaffoldState extends State<StaffHomeScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PERSONAL GOLDEN XI',
              style: GoogleFonts.lexend(fontSize: 10, color: AppTheme.primaryGold, letterSpacing: 1.5, fontWeight: FontWeight.bold),
            ),
            Text(
              'Gestión de Alineación',
              style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        backgroundColor: AppTheme.backgroundDark.withOpacity(0.9),
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildPitch(),
            const SizedBox(height: 24),
            _buildBenchSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildPitch() {
    return AspectRatio(
      aspectRatio: 3/4,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF201D12),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
               const Color(0xFF2A2618),
               AppTheme.backgroundDark,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppTheme.primaryGold.withOpacity(0.3)),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20)],
        ),
        child: Stack(
          children: [
            // Pitch Markings
            _buildPitchLines(),
            
            // Players (4-3-3 simplistic)
            // Forwards
            _buildPlayerNode(0.15, 0.2, '11', 'Vinícius'),
            _buildPlayerNode(0.5, 0.15, '9', 'Mbappé'),
            _buildPlayerNode(0.85, 0.2, '7', 'Rodrygo'),
            
            // Midfield
            _buildPlayerNode(0.3, 0.45, '5', 'Bellingham'),
            _buildPlayerNode(0.5, 0.55, '8', 'Valverde'),
            _buildPlayerNode(0.7, 0.45, '14', 'Tchouaméni'),

            // Defense
            _buildPlayerNode(0.15, 0.75, '23', 'Mendy'),
            _buildPlayerNode(0.38, 0.8, '22', 'Rüdiger'),
            _buildPlayerNode(0.62, 0.8, '3', 'Militão'),
            _buildPlayerNode(0.85, 0.75, '2', 'Carvajal'),

            // Goalkeeper
            _buildPlayerNode(0.5, 0.92, '1', 'Courtois'),
          ],
        ),
      ),
    );
  }

  Widget _buildPitchLines() {
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.primaryGold.withOpacity(0.1), width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              // Halfway line
              Center(child: Container(height: 1, color: AppTheme.primaryGold.withOpacity(0.1))),
              // Center circle
              Center(
                child: Container(
                  width: 80, height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme.primaryGold.withOpacity(0.1)),
                  ),
                ),
              ),
              // Penalty Areas (Simplified)
              Align(
                alignment: Alignment.topCenter,
                child: Container(width: 150, height: 60, decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppTheme.primaryGold.withOpacity(0.1)), left: BorderSide(color: AppTheme.primaryGold.withOpacity(0.1)), right: BorderSide(color: AppTheme.primaryGold.withOpacity(0.1))))),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(width: 150, height: 60, decoration: BoxDecoration(border: Border(top: BorderSide(color: AppTheme.primaryGold.withOpacity(0.1)), left: BorderSide(color: AppTheme.primaryGold.withOpacity(0.1)), right: BorderSide(color: AppTheme.primaryGold.withOpacity(0.1))))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerNode(double xPercent, double yPercent, String number, String name) {
     return Align(
       alignment: Alignment(
         (xPercent * 2) - 1, // Convert 0..1 to -1..1
         (yPercent * 2) - 1
       ),
       child: Column(
         mainAxisSize: MainAxisSize.min,
         children: [
           Container(
             width: 48, height: 48,
             decoration: BoxDecoration(
               color: AppTheme.surfaceDark,
               shape: BoxShape.circle,
               border: Border.all(color: AppTheme.primaryGold, width: 2),
               boxShadow: [BoxShadow(color: AppTheme.primaryGold.withOpacity(0.3), blurRadius: 10)],
             ),
             child: Center(
               child: Text(
                 number,
                 style: GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
               ),
             ),
           ),
           const SizedBox(height: 4),
           Container(
             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
             decoration: BoxDecoration(
               color: Colors.black.withOpacity(0.8),
               borderRadius: BorderRadius.circular(4),
             ),
             child: Text(
                name,
                style: GoogleFonts.lexend(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white),
             ),
           ),
         ],
       ),
     );
  }

  Widget _buildBenchSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('BANQUILLO', style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[500], letterSpacing: 1.5)),
          const SizedBox(height: 12),
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildBenchPlayer('Modrić', '10'),
                _buildBenchPlayer('Camavinga', '12'),
                _buildBenchPlayer('Güler', '24'),
                _buildBenchPlayer('Brahim', '21'),
                _buildBenchPlayer('Kepa', '25'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBenchPlayer(String name, String number) {
    return Container(
      width: 70,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
             width: 40, height: 40,
             decoration: BoxDecoration(
               color: AppTheme.surfaceDark.withOpacity(0.5),
               shape: BoxShape.circle,
               border: Border.all(color: Colors.white.withOpacity(0.1)),
             ),
             child: Center(child: Text(number, style: const TextStyle(color: Colors.grey))),
          ),
          const SizedBox(height: 4),
          Text(name, style: GoogleFonts.lexend(fontSize: 12, color: Colors.grey[400]), overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
