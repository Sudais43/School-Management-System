import 'package:flutter/material.dart';

class ActionCardItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const ActionCardItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          width: 25,
          height: 25,
          fit: BoxFit.contain,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: 4),
            SizedBox(
              width: 590,
              child: Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
