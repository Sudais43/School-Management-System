import 'package:flutter/material.dart';
import 'package:school_management_system/feature/auth/screens/sign_up3.dart';
import 'package:school_management_system/feature/auth/widgets/custom_edit_text.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({super.key});

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Udemy school, Choose your password',
                style: theme.textTheme.displayLarge,
              ),
              const SizedBox(height: 30),

              CustomEditText(
                labelText: 'Choose a password',
                controller: TextEditingController(),
              ),

              const SizedBox(height: 16),

              CustomEditText(
                labelText: 'Confirm  password',
                controller: TextEditingController(),
              ),
              SizedBox(
                width: 250,
                child: Text(
                  "Must be at least 8 characters long,",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),

              const SizedBox(height: 34),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 48),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp3()),
                  );
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
