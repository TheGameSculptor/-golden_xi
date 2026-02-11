import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/theme/app_theme.dart';
import '../../../../routes/app_routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _selectedRole = 'Player'; // Default role
  bool _isLoading = false;
  bool _obscurePassword = true;
  
  // Controllers
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _handleRegister() async {
    setState(() => _isLoading = true);
    try {
      // 1. Create Auth User
      final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // 2. Save detailed info to Firestore
      if (userCredential.user != null) {
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'firstName': _firstNameController.text.trim(),
          'lastName': _lastNameController.text.trim(),
          'phone': _phoneController.text.trim(),
          'email': _emailController.text.trim(),
          'role': _selectedRole,
          'createdAt': FieldValue.serverTimestamp(),
        });

        if (mounted) {
           ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account created successfully!'),
              backgroundColor: Colors.green,
            ),
          );
          // Navigate to home or login
          // Navigator.pop(context); // Go back to login or replace to Home
        }
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? 'Registration failed'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } catch (e) {
       if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _navigateToLogin() {
    Navigator.pop(context); // Assuming pushed from Login, or use pushNamed to Login
  }

  Widget _buildRoleCard(String role, IconData icon, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedRole = role),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primaryGold.withOpacity(0.1) : AppTheme.surfaceDark.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? AppTheme.primaryGold : Colors.white.withOpacity(0.05),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                   width: 20, height: 20,
                   decoration: BoxDecoration(
                     color: isSelected ? AppTheme.primaryGold : Colors.transparent,
                     shape: BoxShape.circle,
                     border: isSelected ? null : Border.all(color: Colors.grey),
                   ),
                   child: isSelected ? const Icon(Icons.check, size: 12, color: Colors.black) : null,
                ),
              ),
              Icon(
                icon,
                size: 32,
                color: isSelected ? AppTheme.primaryGold : Colors.grey[500],
              ),
              const SizedBox(height: 8),
              Text(
                role,
                style: GoogleFonts.lexend(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? AppTheme.primaryGold : Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      body: Stack(
        children: [
          // Header Image Placeholder
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 250,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF2A261A), // Surface color
                    AppTheme.backgroundDark,
                  ],
                ),
              ),
              child: Stack(
                children: [
                   Center(
                     child: Icon(Icons.sports_soccer, size: 100, color: Colors.white.withOpacity(0.1)),
                   ),
                   Container(
                     decoration: const BoxDecoration(
                       gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, AppTheme.backgroundDark],
                        ),
                     ),
                   ),
                ],
              ),
            ),
          ),
          
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                   const SizedBox(height: 120), // Spacer for header
                   Center(
                     child: Column(
                       children: [
                         Container(
                            width: 56, height: 56,
                            decoration: BoxDecoration(
                              color: AppTheme.primaryGold,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [BoxShadow(color: AppTheme.primaryGold.withOpacity(0.2), blurRadius: 10)],
                            ),
                            child: const Icon(Icons.sports_soccer, color: Colors.black, size: 32),
                         ),
                         const SizedBox(height: 16),
                         Text(
                           'Create Your Legacy',
                           style: GoogleFonts.lexend(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                         ),
                         const SizedBox(height: 8),
                         Text(
                           'Join the Golden XI elite community',
                           style: GoogleFonts.lexend(fontSize: 14, color: Colors.grey[400]),
                         ),
                       ],
                     ),
                   ),
                   
                   const SizedBox(height: 32),
                   
                   Text(
                     'SELECT YOUR ROLE',
                     style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primaryGold.withOpacity(0.8), letterSpacing: 1),
                   ),
                   const SizedBox(height: 16),
                   Row(
                     children: [
                       _buildRoleCard('Player', Icons.sports_esports, _selectedRole == 'Player'),
                       const SizedBox(width: 12),
                       _buildRoleCard('Staff', Icons.assignment_ind, _selectedRole == 'Staff'),
                       const SizedBox(width: 12),
                       _buildRoleCard('Owner', Icons.diamond, _selectedRole == 'Owner'),
                     ],
                   ),
                   
                   const SizedBox(height: 32),
                   
                   // Form
                   Row(
                     children: [
                       Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('First Name', style: GoogleFonts.lexend(color: Colors.grey[400], fontSize: 13)),
                             const SizedBox(height: 8),
                             TextFormField(
                               controller: _firstNameController,
                               style: const TextStyle(color: Colors.white),
                               decoration: const InputDecoration(hintText: 'John'),
                             ),
                           ],
                         ),
                       ),
                       const SizedBox(width: 16),
                       Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('Last Name', style: GoogleFonts.lexend(color: Colors.grey[400], fontSize: 13)),
                             const SizedBox(height: 8),
                             TextFormField(
                               controller: _lastNameController,
                               style: const TextStyle(color: Colors.white),
                               decoration: const InputDecoration(hintText: 'Doe'),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                   
                   const SizedBox(height: 16),
                   
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Phone Number', style: GoogleFonts.lexend(color: Colors.grey[400], fontSize: 13)),
                       const SizedBox(height: 8),
                       TextFormField(
                          controller: _phoneController,
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(hintText: '(555) 000-0000', prefixIcon: Icon(Icons.phone, color: Colors.grey)),
                       ),
                     ],
                   ),

                   const SizedBox(height: 16),

                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Email Address', style: GoogleFonts.lexend(color: Colors.grey[400], fontSize: 13)),
                       const SizedBox(height: 8),
                       TextFormField(
                          controller: _emailController,
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(hintText: 'john@goldenxi.com', prefixIcon: Icon(Icons.mail, color: Colors.grey)),
                       ),
                     ],
                   ),
                   
                   const SizedBox(height: 16),

                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Password', style: GoogleFonts.lexend(color: Colors.grey[400], fontSize: 13)),
                       const SizedBox(height: 8),
                       TextFormField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '••••••••', 
                            prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                            suffixIcon: IconButton(
                              icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
                              onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                            )
                          ),
                       ),
                     ],
                   ),
                   
                   const SizedBox(height: 32),
                   
                   ElevatedButton(
                     onPressed: _isLoading ? null : _handleRegister,
                      child: _isLoading 
                        ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.black, strokeWidth: 2))
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Register Account'),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_forward, size: 18),
                            ],
                          ),
                   ),
                   
                   const SizedBox(height: 24),
                   
                   Center(
                     child: TextButton(
                       onPressed: _navigateToLogin,
                       child: RichText(
                         text: TextSpan(
                           style: GoogleFonts.lexend(fontSize: 14, color: Colors.grey[400]),
                           children: [
                             const TextSpan(text: 'Already a member? '),
                             TextSpan(
                               text: 'Log in',
                               style: TextStyle(
                                 color: AppTheme.primaryGold,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
