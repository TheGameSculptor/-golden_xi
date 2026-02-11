import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';

class ClubDashboardView extends StatelessWidget {
  const ClubDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildClubHero(),
          const SizedBox(height: 32),
          _buildStatsRow(),
          const SizedBox(height: 40),
          _buildSectionTitle('Identity Management', 'View All'),
          const SizedBox(height: 16),
          _buildIdentityGrid(),
          const SizedBox(height: 40),
          _buildSectionTitle('Club Updates', null),
          const SizedBox(height: 16),
          _buildClubUpdatesList(),
        ],
      ),
    );
  }

  Widget _buildClubHero() {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 90, height: 90,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppTheme.primaryGold.withOpacity(0.5), width: 3)),
                child: const Icon(Icons.shield, color: AppTheme.primaryGold, size: 50),
              ),
              Container(padding: const EdgeInsets.all(6), decoration: const BoxDecoration(color: AppTheme.primaryGold, shape: BoxShape.circle), child: const Icon(Icons.edit, color: Colors.black, size: 14)),
            ],
          ),
          const SizedBox(height: 16),
          Text('Manchester Gold FC', style: GoogleFonts.lexend(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.white)),
          Text('Est. 2024 • Premier League', style: GoogleFonts.lexend(fontSize: 12, color: Colors.white38)),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        Expanded(child: _buildStatItem('VALUATION', '\$12.5M', '+2.4%', Colors.green)),
        const SizedBox(width: 12),
        Expanded(child: _buildStatItem('FAN BASE', '850K', 'Global', null)),
        const SizedBox(width: 12),
        Expanded(child: _buildStatItem('RANK', '#4', 'Elite Tier', AppTheme.primaryGold)),
      ],
    );
  }

  Widget _buildStatItem(String label, String value, String sub, Color? subColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      decoration: BoxDecoration(color: AppTheme.surfaceDark, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Text(label, style: GoogleFonts.lexend(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.white38, letterSpacing: 1)),
          const SizedBox(height: 8),
          Text(value, style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.primaryGold)),
          const SizedBox(height: 4),
          Text(sub, style: GoogleFonts.lexend(fontSize: 9, fontWeight: FontWeight.w600, color: subColor ?? Colors.white24)),
        ],
      ),
    );
  }

  Widget _buildIdentityGrid() {
    return Row(
      children: [
        Expanded(child: _buildIdentityItem(Icons.checkroom, 'Edit Kit', 'Season 24/25')),
        const SizedBox(width: 12),
        Expanded(child: _buildIdentityItem(Icons.stadium, 'Stadium', 'Capacity: 45k')),
      ],
    );
  }

  Widget _buildIdentityItem(IconData icon, String title, String sub) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppTheme.surfaceDark, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white.withOpacity(0.05))),
      child: Column(
        children: [
          Container(width: 50, height: 50, decoration: BoxDecoration(color: Colors.black.withOpacity(0.3), shape: BoxShape.circle), child: Icon(icon, color: AppTheme.primaryGold, size: 24)),
          const SizedBox(height: 16),
          Text(title, style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
          Text(sub, style: GoogleFonts.lexend(fontSize: 10, color: Colors.white24)),
        ],
      ),
    );
  }

  Widget _buildClubUpdatesList() {
    return Column(
      children: [
        _buildUpdateItem(Icons.monetization_on, 'Merchandise Revenue', 'Weekly payout processed.', '+\$45k', isGold: true),
        const SizedBox(height: 12),
        _buildUpdateItem(Icons.person_add, 'New Signing Scouted', 'Junior striker from Brazil academy.', null),
      ],
    );
  }

  Widget _buildUpdateItem(IconData icon, String title, String sub, String? trail, {bool isGold = false, bool isRed = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppTheme.surfaceDark, borderRadius: BorderRadius.circular(16), border: isGold ? const Border(left: BorderSide(color: AppTheme.primaryGold, width: 4)) : null),
      child: Row(
        children: [
          Container(width: 40, height: 40, decoration: BoxDecoration(color: Colors.black.withOpacity(0.3), shape: BoxShape.circle), child: Icon(icon, color: Colors.white38, size: 18)),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)), Text(sub, style: GoogleFonts.lexend(fontSize: 11, color: Colors.white24))])),
          if (trail != null) Text(trail, style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: isGold ? AppTheme.primaryGold : (isRed ? Colors.red : Colors.white38))),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String text, String? action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        if (action != null) Text(action, style: GoogleFonts.lexend(fontSize: 12, color: AppTheme.primaryGold)),
      ],
    );
  }
}
