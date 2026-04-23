import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alumini_screen/src/shared/providers/auth_provider.dart';
import 'package:alumini_screen/src/login/login_page.dart';
// import 'package:alumini_screen/src/shared/widgets/main_layout.dart'; // REMOVED
// import 'package:alumini_screen/src/student/shared/widgets/student_main_layout.dart'; // REMOVED
import 'package:alumini_screen/src/admin/dashboard/admin_main_layout.dart';

/// A widget that decides which screen to show based on the current authentication state.
/// 
/// It handles:
/// 1. Not Authenticated -> LoginScreen
/// 2. Profile Incomplete -> ProfileSetupPage (Role-specific)
/// 3. Authenticated & Complete -> MainLayout (Role-specific)
class AuthDispatcher extends StatelessWidget {
  const AuthDispatcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
        // 1. Check Authentication
        if (!auth.isAuthenticated) {
          return const LoginScreen();
        }

        // 2. Admin Dashboard
        return const AdminMainLayout();
      },
    );
  }
}
