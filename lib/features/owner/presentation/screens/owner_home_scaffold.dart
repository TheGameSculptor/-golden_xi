import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:golden_xi/core/theme/app_theme.dart';
import 'package:golden_xi/routes/app_routes.dart';

class OwnerHomeScaffold extends StatefulWidget {
  const OwnerHomeScaffold({super.key});

  @override
  State<OwnerHomeScaffold> createState() => _OwnerHomeScaffoldState();
}

class _OwnerHomeScaffoldState extends State<OwnerHomeScaffold> {
  // Simulating empty state first, then having a club.
  bool _hasClub = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: _hasClub ? _buildClubDashboard() : _buildEmptyState(),
                ),
              ],
            ),
          ),
           Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomNav(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Hero(
             tag: 'app_logo',
             child: Icon(Icons.shield, color: AppTheme.primaryGold, size: 32),
          ),
          Text(
            'PORTAL DE PROPIETARIOS',
            style: GoogleFonts.lexend(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 32), // Balance
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120, height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primaryGold.withOpacity(0.05),
                border: Border.all(color: AppTheme.primaryGold, width: 2, style: BorderStyle.solid),
              ),
              child: Icon(Icons.add_business, size: 48, color: AppTheme.primaryGold),
            ),
            const SizedBox(height: 32),
            Text(
              'No hay club registrado',
              style: GoogleFonts.lexend(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 12),
            Text(
              'Comienza tu viaje registrando los detalles oficiales de tu club.',
              textAlign: TextAlign.center,
              style: GoogleFonts.lexend(fontSize: 14, color: Colors.grey[400], height: 1.5),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.createClub);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryGold,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: GoogleFonts.lexend(fontWeight: FontWeight.bold),
              ),
              child: const Text('REGISTRAR NUEVO CLUB'),
            ),
             const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildClubDashboard() {
     return SingleChildScrollView(
       padding: const EdgeInsets.all(24),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           _buildClubCard(),
           const SizedBox(height: 24),
           Text('ACCIONES RÁPIDAS', style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[500], letterSpacing: 1.5)),
           const SizedBox(height: 16),
           Row(
             children: [
               Expanded(child: _buildActionCard('Gestionar\nPersonal', Icons.people_outline)),
               const SizedBox(width: 16),
               Expanded(child: _buildActionCard('Finanzas\nClub', Icons.attach_money)),
             ],
           ),
            const SizedBox(height: 16),
           Row(
             children: [
               Expanded(child: _buildActionCard('Mercado de\nTransferencias', Icons.swap_horiz)),
               const SizedBox(width: 16),
               Expanded(child: _buildActionCard('Ajustes del\nClub', Icons.settings_outlined)),
             ],
           ),
           const SizedBox(height: 100),
         ],
       ),
     );
  }

  Widget _buildClubCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.surfaceDark,
            Colors.black,
          ],
        ),
        border: Border.all(color: AppTheme.primaryGold.withOpacity(0.3)),
        boxShadow: [BoxShadow(color: AppTheme.primaryGold.withOpacity(0.1), blurRadius: 20)],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 64, height: 64,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: const Icon(Icons.shield, color: Colors.white, size: 32),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('MADRID ELITE FC', style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text('Presidente: Juan Pérez', style: GoogleFonts.lexend(fontSize: 12, color: Colors.grey[400])),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(color: Colors.white12),
          const SizedBox(height: 16),
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               _buildClubStat('Equipos', '3'),
               _buildClubStat('Personal', '12'),
               _buildClubStat('Jugadores', '45'),
             ],
          ),
        ],
      ),
    );
  }

  Widget _buildClubStat(String label, String value) {
    return Column(
      children: [
        Text(value, style: GoogleFonts.lexend(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.primaryGold)),
        Text(label, style: GoogleFonts.lexend(fontSize: 12, color: Colors.grey[500])),
      ],
    );
  }

  Widget _buildActionCard(String title, IconData icon) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
         color: AppTheme.surfaceDark,
         borderRadius: BorderRadius.circular(16),
         border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: AppTheme.primaryGold),
          Text(title, style: GoogleFonts.lexend(fontWeight: FontWeight.w600, color: Colors.white)),
        ],
      ),
    );
  }
  
  Widget _buildBottomNav() {
     return Container(
       padding: const EdgeInsets.only(top: 16, bottom: 24, left: 24, right: 24),
       decoration: BoxDecoration(
         color: AppTheme.backgroundDark.withOpacity(0.9),
         borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
         border: Border(top: BorderSide(color: AppTheme.primaryGold.withOpacity(0.2))),
       ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           IconButton(
             icon: const Icon(Icons.dashboard, color: AppTheme.primaryGold), 
             onPressed: () {}, // Current Screen
           ),
           IconButton(
             icon: Icon(Icons.message, color: Colors.grey[700]),
             onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Mensajería próximamente'))),
           ),
           IconButton(
             icon: Icon(Icons.person, color: Colors.grey[700]), 
             onPressed: () => Navigator.pushNamed(context, AppRoutes.ownerProfile),
           ),
         ],
       ),
     );
  }
}
