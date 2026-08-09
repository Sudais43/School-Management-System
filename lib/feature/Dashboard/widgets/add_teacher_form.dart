import 'package:flutter/material.dart';

class AddTeacherForm extends StatefulWidget {
  const AddTeacherForm({super.key});

  @override
  State<AddTeacherForm> createState() => _AddTeacherFormState();
}

class _AddTeacherFormState extends State<AddTeacherForm> {
  // --- Controllers for text fields ---
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // --- Dropdown selected values ---
  String? _selectedClass;
  String? _selectedGender;
  String? _selectedSubject;

  // --- Toggle for Manual vs CSV ---
  String _selectedTab = 'Manual'; // 'Manual' or 'CSV'

  // --- Sample dropdown data ---
  final List<String> _classes = ['JSS 1', 'JSS 2', 'JSS 3', 'SS 1', 'SS 2', 'SS 3'];
  final List<String> _genders = ['Male', 'Female', 'Other'];
  final List<String> _subjects = [
    'Mathematics',
    'English',
    'Chemistry',
    'Physics',
    'Biology',
    'Geography',
    'History',
    'French'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        // This prevents overflow when the keyboard opens
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // --- Header: Title & Close button ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Teachers',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // --- Toggle: Manual vs Import CSV ---
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'Manual', label: Text('Manually')),
                ButtonSegment(value: 'CSV', label: Text('Import CSV')),
              ],
              selected: {_selectedTab},
              onSelectionChanged: (Set<String> newSelection) {
                setState(() {
                  _selectedTab = newSelection.first;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return Theme.of(context).colorScheme.primary;
                  }
                  return Colors.grey.shade200;
                }),
                foregroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.white;
                  }
                  return Colors.black87;
                }),
              ),
            ),
            const SizedBox(height: 24),

            // --- Form Fields ---
            // Full Name
            TextFormField(
              controller: _fullNameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Email
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Row for Class & Gender (side by side)
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedClass,
                    decoration: const InputDecoration(
                      labelText: 'Class',
                      border: OutlineInputBorder(),
                    ),
                    items: _classes.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedClass = newValue;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedGender,
                    decoration: const InputDecoration(
                      labelText: 'Gender',
                      border: OutlineInputBorder(),
                    ),
                    items: _genders.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedGender = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Password
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Phone Number
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Subject Dropdown
            DropdownButtonFormField<String>(
              value: _selectedSubject,
              decoration: const InputDecoration(
                labelText: 'Subject',
                border: OutlineInputBorder(),
              ),
              items: _subjects.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedSubject = newValue;
                });
              },
            ),
            const SizedBox(height: 32),

            // --- Action Buttons: Add another & Add Teacher ---
            Row(
              children: [
                // "Add another" - TextButton (left)
                TextButton.icon(
                  onPressed: () {
                    // Logic to save current teacher and clear the form
                    _clearForm();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Teacher saved! Form cleared for next entry.')),
                    );
                  },
                  icon: const Icon(Icons.add_circle_outline),
                  label: const Text('Add another'),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
                const Spacer(),
                // "Add Teacher" - Elevated Button (right)
                ElevatedButton.icon(
                  onPressed: () {
                    // Logic to save and close the form
                    _submitForm();
                  },
                  icon: const Icon(Icons.person_add),
                  label: const Text('Add Teacher'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // --- Helper functions for the buttons ---
  void _clearForm() {
    setState(() {
      _fullNameController.clear();
      _emailController.clear();
      _passwordController.clear();
      _phoneController.clear();
      _selectedClass = null;
      _selectedGender = null;
      _selectedSubject = null;
    });
  }

  void _submitForm() {
    // TODO: Connect this to your Express.js backend later!
    // For now, just print the data and close.
    print('Full Name: ${_fullNameController.text}');
    print('Email: ${_emailController.text}');
    print('Class: $_selectedClass');
    print('Gender: $_selectedGender');
    print('Password: ${_passwordController.text}');
    print('Phone: ${_phoneController.text}');
    print('Subject: $_selectedSubject');

    // Show a success message and close
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Teacher added successfully!')),
    );
    Navigator.pop(context);
  }
}