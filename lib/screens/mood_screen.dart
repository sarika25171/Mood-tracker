import 'package:flutter/material.dart';

class MoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Today\'s Mood'),
        backgroundColor: Color(0xFFF7F6E7),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'How do you feel today?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            MoodSelector(), // ส่วนที่ให้ผู้ใช้เลือกอารมณ์
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // เพิ่มโค้ดในการบันทึกข้อมูล
                Navigator.pop(context);
              },
              child: Text('Save Mood'),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoodSelector extends StatefulWidget {
  @override
  _MoodSelectorState createState() => _MoodSelectorState();
}

class _MoodSelectorState extends State<MoodSelector> {
  String _selectedMood = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<String>(
          title: Text('Happy'),
          value: 'Happy',
          groupValue: _selectedMood,
          onChanged: (value) {
            setState(() {
              _selectedMood = value!;
            });
          },
        ),
        RadioListTile<String>(
          title: Text('Sad'),
          value: 'Sad',
          groupValue: _selectedMood,
          onChanged: (value) {
            setState(() {
              _selectedMood = value!;
            });
          },
        ),
        RadioListTile<String>(
          title: Text('Neutral'),
          value: 'Neutral',
          groupValue: _selectedMood,
          onChanged: (value) {
            setState(() {
              _selectedMood = value!;
            });
          },
        ),
      ],
    );
  }
}
