import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_theme.dart';

class PlayerHomeScaffold extends StatefulWidget {
  const PlayerHomeScaffold({super.key});

  @override
  State<PlayerHomeScaffold> createState() => _PlayerHomeScaffoldState();
}

class _PlayerHomeScaffoldState extends State<PlayerHomeScaffold> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      body: Stack(
        children: [
          // Background accents
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: AppTheme.primaryGold.withOpacity(0.05),
                shape: BoxShape.circle,
                backgroundBlendMode: BlendMode.plus,
              ),
            ).transform(Matrix4.translationValues(100, -100, 0)),
          ),
          
          SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        _buildStatusSection(),
                        const SizedBox(height: 24),
                        _buildStatsStrip(),
                        const SizedBox(height: 24),
                        _buildNextMatchCard(),
                        const SizedBox(height: 24),
                        _buildQuickActions(),
                        const SizedBox(height: 24),
                        _buildTournamentsList(),
                        const SizedBox(height: 100), // Bottom padding for nav bar
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Bottom Navigation
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.primaryGold.withOpacity(0.4)),
                  image: const DecorationImage(
                    image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDwvz91GhTAsIf1y1H383Idtiij_DPVTk-o4a7-EqW6_yyd5buV6kOECGBxYhm4uCh12evp4G-FxjQrgyaTKevHeqhrHIWSw3GYIv8s5rLjL3MuqXLOsUOhKGn0IVV1TLprSspXUAYlkeGCl-Lp_VYAx-QK0fUYTZ1WLgWb0yxrLFfBrW-o7C9FIQat-yYHhvOYfaO-Oygqx8b-s5NKPx2fLMqbcxtw7jj1XXdlNC1X2TZ_1FvrkKl9mC0aj1xZuee5CngGGGlRWQ'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GOLDEN XI',
                    style: GoogleFonts.lexend(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryGold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Text(
                    'Hello, Alex',
                    style: GoogleFonts.lexend(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined, color: AppTheme.primaryGold),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        RichText(
          text: TextSpan(
            style: GoogleFonts.lexend(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.italic,
              color: Colors.white,
              height: 1.1,
            ),
            children: [
              const TextSpan(text: 'READY FOR\n'),
              TextSpan(
                text: 'THE PITCH?',
                style: TextStyle(color: AppTheme.primaryGold),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.primaryGold.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.primaryGold.withOpacity(0.3)),
          ),
          child: Text(
            'RANK #42',
            style: GoogleFonts.lexend(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryGold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsStrip() {
    return Row(
      children: [
        Expanded(child: _buildStatCard('Win Rate', '68%', false)),
        const SizedBox(width: 12),
        Expanded(child: _buildStatCard('MMR', '2,450', true)),
        const SizedBox(width: 12),
        Expanded(child: _buildStatCard('Matches', '142', false)),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, bool highlight) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
        border: highlight 
            ? Border.all(color: AppTheme.primaryGold.withOpacity(0.4))
            : Border.all(color: Colors.white.withOpacity(0.05)),
        boxShadow: highlight 
            ? [BoxShadow(color: AppTheme.primaryGold.withOpacity(0.15), blurRadius: 15)]
            : [],
      ),
      child: Column(
        children: [
          Text(
            label.toUpperCase(),
            style: GoogleFonts.lexend(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: highlight ? AppTheme.primaryGold : Colors.grey[400],
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.lexend(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: highlight ? AppTheme.primaryGold : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextMatchCard() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'NEXT MATCH',
              style: GoogleFonts.lexend(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey[300],
                letterSpacing: 1.5,
              ),
            ),
            Row(
              children: [
                Container(width: 6, height: 6, decoration: const BoxDecoration(color: AppTheme.primaryGold, shape: BoxShape.circle)),
                const SizedBox(width: 6),
                Text(
                  'Live Check-in',
                  style: GoogleFonts.lexend(
                    fontSize: 12,
                    color: AppTheme.primaryGold,
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.primaryGold),
            boxShadow: [BoxShadow(color: AppTheme.primaryGold.withOpacity(0.15), blurRadius: 20)],
            image: const DecorationImage(
              image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCMRGA1Z7e-aqsyxkUOIJR0pxSDdHraxW3aR4uLnQwXhBgf1LDPYdAgNY-HiFnyvOUgKmut0Bhdtwi6jtneT5HzeWlTRtXx63qkom-qyHqu_soN3_p5YhRIya7CkCckdic-sxR0VaNqhUc3Ou7gvi30Q6qLS_DYhVs98PMw3lQmEIt7XQdknOGANMEKe0PBxetm3aetmYMs6feRmB060Eski2Vyjqn4EbeTZzBTo73OGbm5zBJLy1z7Xopr5fZVkAn_aCWL9C-l6w'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'GOLDEN XI CUP - QUARTER FINAL',
                  style: GoogleFonts.lexend(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey[400], letterSpacing: 2),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTeamColumn('GXI Elite', Icons.shield, AppTheme.primaryGold),
                    Column(
                      children: [
                         Text('VS', style: GoogleFonts.lexend(fontSize: 24, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: AppTheme.primaryGold)),
                         Text('18:00 EST', style: GoogleFonts.lexend(fontSize: 12, color: Colors.grey[400])),
                      ],
                    ),
                    _buildTeamColumn('Liquid', Icons.water_drop, Colors.grey),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryGold,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.login, size: 20),
                      const SizedBox(width: 8),
                      Text('Check-in Now', style: GoogleFonts.lexend(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.lexend(fontSize: 12, color: Colors.grey[500]),
                    children: [
                      const TextSpan(text: 'Check-in closes in '),
                      TextSpan(text: '14:20', style: GoogleFonts.jetBrainsMono(color: Colors.grey[300])),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTeamColumn(String name, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          width: 56, height: 56,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Icon(icon, color: color, size: 30),
        ),
        const SizedBox(height: 8),
        Text(name, style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Row(
      children: [
        Expanded(child: _buildActionCard('Find Match', 'Ranked Queue', Icons.search)),
        const SizedBox(width: 16),
        Expanded(child: _buildActionCard('Team Chat', '3 New Msgs', Icons.chat)),
      ],
    );
  }

  Widget _buildActionCard(String title, String subtitle, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: AppTheme.primaryGold.withOpacity(0.2), shape: BoxShape.circle),
            child: Icon(icon, color: AppTheme.primaryGold, size: 20),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
              Text(subtitle, style: GoogleFonts.lexend(fontSize: 10, color: Colors.grey[400])),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTournamentsList() {
    return Column(
      children: [
        Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text('OTHER TOURNAMENTS', style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[300], letterSpacing: 1.5)),
             Text('View All', style: GoogleFonts.lexend(fontSize: 12, color: AppTheme.primaryGold)),
           ],
        ),
        const SizedBox(height: 12),
        _buildTournamentCard('Weekly Showdown', 'Round 3 of 8', 'Active', Colors.green),
        const SizedBox(height: 12),
        _buildTournamentCard('Summer League', 'Starts in 2d', 'Reg Open', AppTheme.primaryGold),
      ],
    );
  }

  Widget _buildTournamentCard(String title, String subtitle, String tag, Color tagColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            width: 48, height: 48,
            decoration: BoxDecoration(
              gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF2A2A2A), Colors.black]),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: Icon(Icons.emoji_events, color: Colors.grey[400]),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                         color: tagColor.withOpacity(0.2),
                         borderRadius: BorderRadius.circular(4),
                         border: Border.all(color: tagColor.withOpacity(0.3)),
                      ),
                      child: Text(tag, style: TextStyle(fontSize: 10, color: tagColor)),
                    ),
                    const SizedBox(width: 8),
                    Text(subtitle, style: TextStyle(fontSize: 10, color: Colors.grey[400])),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
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
         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20, offset: const Offset(0, -5))],
       ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           _buildNavItem(Icons.emoji_events, 'Tournaments', 0),
           _buildNavItem(Icons.groups, 'Social', 1),
           _buildNavItem(Icons.shield, 'My Team', 2),
           _buildNavItem(Icons.person, 'Profile', 3),
         ],
       ),
     );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? AppTheme.primaryGold : Colors.grey[600]),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.lexend(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: isSelected ? AppTheme.primaryGold : Colors.grey[600],
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.top(4),
              width: 4, height: 4,
              decoration: const BoxDecoration(color: AppTheme.primaryGold, shape: BoxShape.circle),
            ),
        ],
      ),
    );
  }
}
