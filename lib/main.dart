import 'package:flutter/material.dart';
import 'screens/calendar/calendar_screen.dart';
import 'screens/diary/diary_screen.dart';
import 'screens/report/report_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/mood_screen.dart'; // นำเข้า MoodScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Navigation Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    CalendarScreen(),
    DiaryScreen(),
    MoodScreen(), // เพิ่มหน้า Mood
    ReportScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      _showAddDialog();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add New Entry"),
          content: Text("คุณต้องการเพิ่มข้อมูลใหม่หรือไม่?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MoodScreen()), // เปิดหน้า Mood
                );
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _showMoodScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MoodScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 2 ? Container() : _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: _showMoodScreen,
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.black,
        shape: CircleBorder(),
        elevation: 5,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Color(0xFFF7F6E7),
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.calendar_today,
                    color: _selectedIndex == 0 ? Colors.black : Colors.grey),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: Icon(Icons.book,
                    color: _selectedIndex == 1 ? Colors.black : Colors.grey),
                onPressed: () => _onItemTapped(1),
              ),
              SizedBox(width: 40),
              IconButton(
                icon: Icon(Icons.bar_chart,
                    color: _selectedIndex == 3 ? Colors.black : Colors.grey),
                onPressed: () => _onItemTapped(3),
              ),
              IconButton(
                icon: Icon(Icons.settings,
                    color: _selectedIndex == 4 ? Colors.black : Colors.grey),
                onPressed: () => _onItemTapped(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
