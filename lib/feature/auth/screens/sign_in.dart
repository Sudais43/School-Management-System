import 'package:flutter/material.dart';
import 'package:school_management_system/core/theme/presentation/widgets/theme_toggle_button.dart';
import 'package:school_management_system/feature/Dashboard/screens/dashboard.dart';
import 'package:school_management_system/feature/auth/screens/sign_up.dart';
import 'package:school_management_system/feature/auth/widgets/custom_edit_text.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        actions: const [ThemeToggleButton(), SizedBox(width: 8)],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome, Login into your account',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 20),
              Text(
                "It's our great pleasure to have \n you on board",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              CustomEditText(
                labelText: 'Enter your email',
                controller: _emailController,
              ),
              const SizedBox(height: 16),
              CustomEditText(
                labelText: 'Enter your password',
                controller: _passwordController,
              ),

              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 48),
                ),
                onPressed: () {
                  // Handle login logic here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Dashboard()),
                  );
                },
                child: const Text('Login'),
              ),

              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  );
                },
                child: Text("Don't have an account? Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
