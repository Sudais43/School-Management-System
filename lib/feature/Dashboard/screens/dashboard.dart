import 'package:flutter/material.dart';
import 'package:school_management_system/feature/Dashboard/pages/dashboard_home_content.dart';
import 'package:school_management_system/feature/Dashboard/pages/teacher_page.dart';
import 'package:school_management_system/feature/Dashboard/widgets/side_bar_navigation.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // 1. Manage the selected index here
  int _selectedIndex = 0;

  // 2. Build a list of pages/screens for each navigation item
  // For now, we use placeholders. You will replace these with actual Screens later.
  final List<Widget> _pages = [
    const DashboardHomeContent(), // Your current UI (Text + Action Cards)
    // const Center(child: Text('Teachers Page', style: TextStyle(fontSize: 24))),
    TeacherPage(),
    const Center(
      child: Text('Students/Classes Page', style: TextStyle(fontSize: 24)),
    ),
    const Center(child: Text('Billing Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Settings Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Exams Page', style: TextStyle(fontSize: 24))),
  ];

  // 3. Callback to update the index when a sidebar item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // Align top
          children: [
            // const SizedBox(width: 65),
            // 4. Pass the index and the callback to the sidebar
            SideBarNavigation(
              selectedIndex: _selectedIndex,
              onItemSelected: _onItemTapped,
            ),
            // 5. Expanded area now shows the selected page
            Expanded(
              child:
                  _pages[_selectedIndex], // Directly display the selected page
            ),
          ],
        ),
      ),
    );
  }
}
