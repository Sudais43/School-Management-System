import 'package:flutter/material.dart';
import 'package:school_management_system/feature/auth/screens/sign_in.dart';

class TopHeaderBar extends StatelessWidget {
  const TopHeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Learn how to launch faster',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'watch our webinar for tips from our experts and get a limited time offer.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const Spacer(),

        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_outlined),
        ),

        const SizedBox(width: 10),

        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignIn()),
            );
          },
          child: Text(
            "Logout",
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
