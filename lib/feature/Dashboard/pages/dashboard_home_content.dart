import 'package:flutter/material.dart';
import 'package:school_management_system/feature/Dashboard/widgets/action_card_item.dart';
import 'package:school_management_system/feature/Dashboard/widgets/top_header_bar.dart';

class DashboardHomeContent extends StatelessWidget {
  const DashboardHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopHeaderBar(),
          const SizedBox(height: 40),
          Text(
            'Welcome to the Dashboard, Udemy School',
            style: theme.textTheme.displayLarge,
          ),
          const SizedBox(height: 30),
          Text('School@domain.com', style: theme.textTheme.bodyLarge),
          const SizedBox(height: 40),
          ActionCardItem(
            title: 'Add Subjects',
            description:
                'Quickly create and manage new subjects for your schools curriculum, streamlining the process for teachers and administrators',
            imagePath: "assets/icons/books.png",
          ),
          const SizedBox(height: 20),
          ActionCardItem(
            title: 'Add Classes',
            description:
                'Create rich course content and coaching products for your students.When you give them a pricing plan, they’ll appear on your site!',
            imagePath: "assets/icons/bank.png",
          ),
          const SizedBox(height: 20),
          ActionCardItem(
            title: 'Add Students',
            description:
                'Create rich course content and coaching products for your students.When you give them a pricing plan, they’ll appear on your site!',
            imagePath: "assets/icons/teacher.png",
          ),
        ],
      ),
    );
  }
}