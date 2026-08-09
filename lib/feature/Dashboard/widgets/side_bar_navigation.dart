import 'package:flutter/material.dart';
import 'package:school_management_system/core/theme/app_colors.dart';

class SideBarNavigation extends StatelessWidget {

  final int selectedIndex;
  final Function(int) onItemSelected;

  const SideBarNavigation({super.key, required this.selectedIndex, required this.onItemSelected});


  final List<_NavigationData> _navItem = const [
    _NavigationData(title: 'Dashboard', icon: Icons.dashboard),
    _NavigationData(title: 'Teachers', icon: Icons.person),
    _NavigationData(title: 'Students/ classes', icon: Icons.people),
    _NavigationData(title: 'Billing', icon: Icons.account_balance_outlined),
    _NavigationData(title: 'Settings and profile', icon: Icons.settings),
    _NavigationData(title: 'Exams', icon: Icons.analytics_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: AppColors.sidebarBackground,
      child: SizedBox(
        width: 260,
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildLogoHeader(context),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _navItem.length,
                itemBuilder: (context, index) {
                  final item = _navItem[index];
                  final isSelected = selectedIndex == index;
                  return ListTile(
                    leading: Icon(
                      item.icon,
                      color: isSelected
                          ? theme.colorScheme.primary
                          : AppColors.darkTextPrimary,
                    ),
                    title: Text(
                      item.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: isSelected
                            ? theme.colorScheme.primary
                            : AppColors.darkTextPrimary,
                      ),
                    ),
                    selected: isSelected,
                    selectedTileColor: theme.colorScheme.primary.withOpacity(
                      0.1,
                    ),
                    onTap: () {
                      onItemSelected(index);
                      // setState(() {
                      //   onItem
                      //   // _selectedIndex = index;
                      // });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoHeader(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Image.asset('assets/icons/metra_logo.png', fit: BoxFit.cover),
        ),
        const SizedBox(height: 8),
        Text(
          'Metra school System',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}

class _NavigationData {
  final String title;
  final IconData icon;
  const _NavigationData({required this.title, required this.icon});
}
