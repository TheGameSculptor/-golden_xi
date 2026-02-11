import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:golden_xi/core/theme/app_theme.dart';

class PlayerSelectionModal extends StatelessWidget {
  const PlayerSelectionModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.92,
      decoration: BoxDecoration(
        color: AppTheme.backgroundDark,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        border: Border(top: BorderSide(color: AppTheme.primaryGold.withOpacity(0.2))),
      ),
      child: Column(
        children: [
          // Handle
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 48,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SELECCIONAR JUGADOR',
                      style: GoogleFonts.lexend(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.grey),
                      onPressed: () => Navigator.pop(context),
                      style: IconButton.styleFrom(backgroundColor: Colors.grey[800]),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.sports_soccer, color: AppTheme.primaryGold, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      'POSICIÓN: DELANTERO CENTRO (DC)',
                      style: GoogleFonts.lexend(
                        color: AppTheme.primaryGold,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800]!.withOpacity(0.5),
                hintText: 'Buscar por nombre o dorsal...',
                hintStyle: TextStyle(color: Colors.grey[500]),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Player List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                _buildPlayerCard(
                  name: 'L. Martínez',
                  role: 'Titular • DC',
                  number: '10',
                  fitness: '94%',
                  image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDiCZORLnT5PvM3sZUoijL--pv2z_-qcdwb7WYRhSVPOeYeubFEPzMq5HE2wuo8v7rMTV_B6BeRYNT-tO90jJxdARdzD5SqW3Kyc2AmirNQ5qMtwNHkgcfY9uVnEbXbwAMemA6a5pECqLCJR8SSlbDLkOyuKaaZ6UzoFMnhTxyJGaM4ITjhaufGkhIs0e2hw_kkAeJR0S7MWduBGgZ_Vy76H_xjdfdNWN4PT2PyfyHUxJ4RwRGgzBxt0GHSc64rdviPoy3rIFjyNg', // Mock image
                  isSelected: true,
                ),
                const SizedBox(height: 12),
                _buildPlayerCard(
                  name: 'J. Alvarez',
                  role: 'Suplente • DC / MP',
                  number: '09',
                  fitness: '88%',
                  image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBohoGLUVoL9d4yhdrKdnM5GKUn7x8MKgwUExSDPoNVlL_3IrHGTDB66twJmOS7ZLtSvNfziWjUPxTijQx6f9uKIQyOuSsqODV6gvvP_E9S1paV4hxEbRuXL6ghuETQkPzLJKvxlPO0QDtoZmDW4-zxvKbnmcq-NT0fwnNc23HsP6y0uNgtiVvMi8kixgm0Tp27GVx172DOjyCnt2q_7nOsS-njCbbxpVeIGyzxQUjFqicb7dIPOKgmIuKauRgz3g25KrJ_mt1bNg',
                  isSelected: false,
                ),
                 const SizedBox(height: 12),
                _buildPlayerCard(
                  name: 'M. Garnacho',
                  role: 'Suplente • EI / ED',
                  number: '19',
                  fitness: '82%',
                  image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDWHHkYgK2ePnRc69kn7bMjplxNIeIUVH8gyJ22wSvzhxTUIM8QXHEhJPcEr572iSdP-0P556mcl4emT4hQceKs8AS5fhNBip47Yk4-049F8ps8yuGVjiEh6LyBGbD8_Hc0ykqVIUP5aLqb8Ua9IUJ5Jg8WHUC0tOlOn1Zd8V2JVYpZF9w3oaxPbO6IulxdWRJvoLxXp_-XR3P9WxM3RkbV3jBy6uiG0d4U-v-vKSX626i1YFpf43hYOJBb3tPWciDUgW3lwj64tw',
                  isSelected: false,
                ),
                 const SizedBox(height: 12),
                _buildPlayerCard(
                  name: 'A. Di Maria',
                  role: 'Lesionado • 2 Semanas',
                  number: '11',
                  fitness: '45%',
                  image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBTRCILkI43wOg-DYiIuphPACd61kh820Ok3No7kYc34bc4NG4vZnvAPQbbPzovf18EpW7-24n3-rl2hXh245aCLbdELqi6elsU1kDwDn288n73GqA5NfC39KI65HoxbzNfjm5Y5GYt3Eu81xvvj9gf6lGlLrHMEYxw80G9_oDKNmljZ5g8eUDVxel7_unoc6rxIY-QPmFxrbCUk8zKCagizeKO6XMKeXR-WB--KT9rTQwUhYlaMCtqy4-FOFIgjVUBS2dWVzkNCg',
                  isInjured: true,
                ),
                 const SizedBox(height: 12),
                _buildPlayerCard(
                  name: 'P. Dybala',
                  role: 'Reserva • MP / DC',
                  number: '21',
                  fitness: '79%',
                  image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCNRqJvsJgTOb0PoSuft_4UlVuGwryu9pATSpVZBuv46zoM4u7uj27xfwGLyy5h56lQ_kmCS9Ldxca8QV1tczVDRrZclR_hNvKEn6Y_NoZ9NbxNZD99p1_m595VB2x4fLvLK_Lh5-vYtv2cPxE9UU2rT_gWWUf_1CDlX262XQuPCbGXdfrrvvE6By2TAfV9wq91osnqMh8A5kWvu35nje_0DpZ8FmPcciaEPqUjXQ5Ix7DsPs-txij-jprM2fZfP3q0EP6enHoa5g',
                ),
                 const SizedBox(height: 70), // Padding for button
              ],
            ),
          ),
          
          // Footer Button
          Padding(
             padding: const EdgeInsets.all(24.0),
             child: SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 onPressed: () => Navigator.pop(context),
                 style: ElevatedButton.styleFrom(
                   backgroundColor: AppTheme.primaryGold,
                   foregroundColor: Colors.black,
                   padding: const EdgeInsets.symmetric(vertical: 16),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                   shadowColor: AppTheme.primaryGold.withOpacity(0.3),
                   elevation: 8,
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       'CONFIRMAR SELECCIÓN',
                       style: GoogleFonts.lexend(
                         fontSize: 16,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     const SizedBox(width: 8),
                     const Icon(Icons.check_circle_outline)
                   ],
                 ),
               ),
             ),
           ),
        ],
      ),
    );
  }

  Widget _buildPlayerCard({
    required String name,
    required String role,
    required String number,
    required String fitness,
    required String image,
    bool isSelected = false,
    bool isInjured = false,
  }) {
    final borderColor = isSelected ? AppTheme.primaryGold : (isInjured ? Colors.transparent : Colors.grey[800]);
    final bgColor = isSelected ? AppTheme.primaryGold.withOpacity(0.1) : Colors.grey[900]!.withOpacity(0.4);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor ?? Colors.transparent, width: isSelected ? 2 : 1),
        boxShadow: isSelected ? [BoxShadow(color: AppTheme.primaryGold.withOpacity(0.15), blurRadius: 15)] : [],
      ),
      child: Row(
        children: [
          // Avatar
          Stack(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isInjured ? Colors.red[900]! : (isSelected ? AppTheme.primaryGold : Colors.grey[700]!), 
                    width: 2
                  ),
                  image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
                ),
                child: isInjured ? Container(color: Colors.black.withOpacity(0.5)) : null,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                  decoration: BoxDecoration(
                    color: isInjured ? Colors.red[600] : (isSelected ? AppTheme.primaryGold : Colors.grey[700]),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppTheme.backgroundDark, width: 2),
                  ),
                  child: Text(
                    number,
                    style: TextStyle(
                      color: isSelected && !isInjured ? Colors.black : Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.lexend(
                    color: isInjured ? Colors.grey[600] : Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: isInjured ? TextDecoration.lineThrough : null,
                  ),
                ),
                Text(
                  role,
                  style: GoogleFonts.lexend(
                    color: isInjured ? Colors.red[500] : Colors.grey[500],
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          // Stats
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                fitness,
                style: GoogleFonts.lexend(
                  color: isInjured ? Colors.grey[600] : (isSelected ? AppTheme.primaryGold : Colors.grey[300]),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'ESTADO DE FORMA',
                style: GoogleFonts.lexend(
                  color: Colors.grey[600],
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          if (isSelected) 
             Padding(
               padding: const EdgeInsets.only(left: 8.0),
               child: Icon(Icons.check_circle, color: AppTheme.primaryGold),
             ),
             
        ],
      ),
    );
  }
}
