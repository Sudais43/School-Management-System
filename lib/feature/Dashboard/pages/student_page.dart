import 'package:flutter/material.dart';
import 'package:school_management_system/core/theme/app_colors.dart';
import 'package:school_management_system/feature/Dashboard/data/teacher_data.dart';
import 'package:school_management_system/feature/Dashboard/widgets/add_teacher_form.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _topHeader(),
            _searchBar(),
            Expanded(child: _bodyList()),
          ],
        ),
      ),
    );
  }

  Widget _topHeader() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        width: 950,
        child: Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Export CSV",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.primaryBlueDark,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                _addTeacher(context);
              },
              child: Text(
                "Add Student",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            ),

            Spacer(),

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined),
            ),
            const SizedBox(width: 10),

            TextButton(
              onPressed: () {},
              child: Text(
                "Logout",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.lightTextPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 950,
          height: 48,
          child: TextField(
            decoration: InputDecoration(
              // labelText: 'Search',
              hintText: 'Search',
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ],
    );
  }

  Widget _bodyList() {
    if (teacherList.isEmpty) {
      return Center(
        child: Text(
          "No Students found.",
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: AppColors.lightTextMuted.withOpacity(0.5),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 1,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: DataTable(
              columnSpacing: 120,
              headingRowColor: Colors.grey[200] != null
                  ? MaterialStateProperty.all(Colors.grey[200])
                  : null,
              columns: const [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Student ID')),
                DataColumn(label: Text('Email address')),
                DataColumn(label: Text('Class')),
                DataColumn(label: Text("Gender")),
              ],
              rows: teacherList.map((teacher) {
                return DataRow(
                  cells: [
                    DataCell(Text(teacher.fullName)),
                    DataCell(Text(teacher.subject)),
                    DataCell(Text(teacher.classGrade)),
                    DataCell(Text(teacher.email)),
                    DataCell(Text(teacher.gender)),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      );
    }
  }

  void _addTeacher(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Teacher'),
          content: SizedBox(width: 700, child: const AddTeacherForm()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
