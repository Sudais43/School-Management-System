import 'package:flutter/material.dart';
import 'package:school_management_system/feature/auth/screens/sign_in.dart';
import 'package:school_management_system/feature/auth/widgets/custom_edit_text.dart';

class SignUp3 extends StatefulWidget {
  const SignUp3({super.key});

  @override
  State<SignUp3> createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Udemy school, Choose your staff',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 20),

              CustomEditText(
                labelText: 'Number of staff',
                controller: TextEditingController(),
              ),

              const SizedBox(height: 16),

              CustomEditText(
                labelText: 'School address',
                controller: TextEditingController(),
              ),

              const SizedBox(height: 34),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 48),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignIn()),
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
