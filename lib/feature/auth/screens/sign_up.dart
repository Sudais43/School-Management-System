import 'package:flutter/material.dart';
import 'package:school_management_system/feature/auth/screens/sign_in.dart';
import 'package:school_management_system/feature/auth/screens/sign_up2.dart';
import 'package:school_management_system/feature/auth/widgets/custom_edit_text.dart';
import '../../../core/theme/presentation/widgets/theme_toggle_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _adminNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _schoolNameController = TextEditingController();

  @override
  void dispose() {
    _adminNameController.dispose();
    _emailController.dispose();
    _schoolNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        actions: const [ThemeToggleButton(), SizedBox(width: 8)],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome, create your school account',
                style: theme.textTheme.displaySmall,
              ),

              const SizedBox(height: 20),

              Text("It's our pleasure to have you on board!"),

              //   const SizedBox(height: 8),
              //   Text(
              //     'Welcome! Select your theme and fill in details below.',
              //     style: theme.textTheme.bodyMedium,
              //   ),
              //   const SizedBox(height: 24),

              // Theme Mode Selector Card
              //   Card(
              //     child: Padding(
              //       padding: const EdgeInsets.all(16.0),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             'Appearance Mode',
              //             style: theme.textTheme.titleMedium,
              //           ),
              //           const SizedBox(height: 12),
              //           const Center(child: ThemeModeSelector()),
              //         ],
              //       ),
              //     ),
              //   ),
              const SizedBox(height: 24),

              CustomEditText(
                labelText: 'Enter the name of admin',
                controller: _adminNameController,
              ),

              const SizedBox(height: 16),

              CustomEditText(
                labelText: 'Name of School',
                controller: _schoolNameController,
              ),

              const SizedBox(height: 16),

              CustomEditText(
                labelText: 'Enter the school email',
                controller: _emailController,
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp2()),
                  );
                },
                child: const Text('Next'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignIn()),
                  );
                },
                child: const Text('Already have an account? Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
