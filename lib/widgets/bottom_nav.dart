import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart';
import '../screens/input_nilai_screen.dart';
import '../screens/data_siswa_screen.dart';
import '../screens/profile_screen.dart';

class BottomNav extends StatelessWidget {
  final int selectedIndex;
  const BottomNav({required this.selectedIndex, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const DashboardScreen(),
      const InputNilaiScreen(),
      const DataSiswaScreen(),
      const ProfileScreen(),
    ];

    void _onItemTapped(int index) {
      if (index == selectedIndex) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => pages[index]),
      );
    }

    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Input Nilai'),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Data Siswa'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
      ],
    );
  }
}
