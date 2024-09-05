import 'package:flutter/material.dart';

class RecruiterPage extends StatelessWidget {
  const RecruiterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text('Recruiter Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Navigate to recruiter's profile
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RecruiterProfilePage()),
              );
            },
          ),
        ],
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

  // Helper function to build list items for each data structure
  Widget _buildListItem(BuildContext context, String title) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PlagiarisedStudentsPage(title: title)),
        );
      },
    );
  }
}

class PlagiarisedStudentsPage extends StatelessWidget {
  final String title;

  const PlagiarisedStudentsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // Mock list of students with plagiarized code for demonstration
    List<String> plagiarisedStudents = [
      'John Doe',
      'Jane Smith',
      'Alice Johnson',
      'Bob Brown',
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('$title - Plagiarized Students'),
      ),
      body: ListView.builder(
        itemCount: plagiarisedStudents.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(plagiarisedStudents[index]),
            subtitle: Text('Plagiarised $title code'),
            trailing: ElevatedButton(
              onPressed: () {
                _sendEmail(context, plagiarisedStudents[index]);
              },
              child: const Text('Send Email'),
            ),
          );
        },
      ),
    );
  }

  // Mock function to simulate sending an email to the student
  void _sendEmail(BuildContext context, String studentName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Email Sent'),
          content: Text(
              'An email has been sent to $studentName regarding plagiarism.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class RecruiterProfilePage extends StatelessWidget {
  const RecruiterProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recruiter Profile'),
      ),
      body: const Center(
        child: Text(
          'Recruiter Profile Information',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
