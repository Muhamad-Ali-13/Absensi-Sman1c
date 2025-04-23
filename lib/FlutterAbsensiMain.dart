import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/absensi_page.dart';
import '../pages/laporan_page.dart';
import '../pages/profile_page.dart';

class FlutterAbsensiMain extends StatefulWidget {
  @override
  _FlutterAbsensiMainState createState() => _FlutterAbsensiMainState();
}

class _FlutterAbsensiMainState extends State<FlutterAbsensiMain> {
  int _selectedIndex = 0;

  // List of pages for navigation
  final List<Widget> _pages = [
    HomePage(), // Home Page
    AbsensiPage(), // Absensi Page
    LaporanPage(), // Laporan Page
    ProfilePage(), // Profile Page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          children: [
            Image.asset(
              'assets/smanic.jpeg', // Replace with your actual logo path
              width: 50,
              height: 50,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aplikasi Absensi Online',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  'SMAN 1 CIAWI',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Absensi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Laporan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}