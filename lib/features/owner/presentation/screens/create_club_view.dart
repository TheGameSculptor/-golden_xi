import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';

class CreateClubView extends StatelessWidget {
  const CreateClubView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ESTABLISH YOUR LEGACY', style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primaryGold, letterSpacing: 2)),
          const SizedBox(height: 8),
          Text('Register Your Club', style: GoogleFonts.lexend(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 32),
          _buildLogoUpload(),
          const SizedBox(height: 32),
          _buildInputField('CLUB NAME', 'e.g. Real Galácticos FC'),
          const SizedBox(height: 20),
          _buildInputField('PRESIDENT NAME', 'e.g. Florentino Pérez'),
          const SizedBox(height: 20),
          _buildInputField('CONTACT EMAIL', 'admin@club.com'),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryGold, foregroundColor: Colors.black, minimumSize: const Size(double.infinity, 60)),
            child: Text('CREATE CLUB', style: GoogleFonts.lexend(fontWeight: FontWeight.w900, fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoUpload() {
    return Center(
      child: Column(
        children: [
          Container(
            width: 120, height: 120,
            decoration: BoxDecoration(color: AppTheme.surfaceDark, shape: BoxShape.circle, border: Border.all(color: AppTheme.primaryGold.withOpacity(0.3))),
            child: const Icon(Icons.add_a_photo, color: AppTheme.primaryGold, size: 40),
          ),
          const SizedBox(height: 12),
          Text('Upload Club Crest', style: GoogleFonts.lexend(fontSize: 12, color: Colors.white38)),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.lexend(color: Colors.white.withOpacity(0.4), fontSize: 10, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(color: AppTheme.surfaceDark, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white.withOpacity(0.1))),
          child: TextField(
            style: const TextStyle(color: Colors.white, fontSize: 14),
            decoration: InputDecoration(hintText: hint, hintStyle: TextStyle(color: Colors.white.withOpacity(0.1)), border: InputBorder.none, contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16)),
          ),
        ),
      ],
    );
  }
}
