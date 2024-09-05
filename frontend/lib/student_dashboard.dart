import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plagiarism_detect/student_response.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ListView(
        children: [
          _buildListItem(context, 'Arrays'),
          _buildListItem(context, 'Linked List'),
          _buildListItem(context, 'Stacks'),
          _buildListItem(context, 'Queues'),
          _buildListItem(context, 'Graphs'),
          _buildListItem(context, 'Trees'),
          _buildListItem(context, 'Binary Trees'),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String title) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
            CupertinoPageRoute(builder: (context) => const StudentPage()));
      },
    );
  }
}
