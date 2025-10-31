import 'package:flutter/material.dart';
import '../screens/input_nilai_screen.dart';
import '../screens/lihat_rapor_screen.dart';
import '../screens/data_siswa_screen.dart';
import '../screens/profile_screen.dart';
import '../widgets/bottom_nav.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Guru'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _ActionCard(
              label: 'Input Nilai',
              icon: Icons.edit,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const InputNilaiScreen()),
                );
              },
            ),
            _ActionCard(
              label: 'Lihat Rapor',
              icon: Icons.receipt_long,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LihatRaporScreen()),
                );
              },
            ),
            _ActionCard(
              label: 'Data Siswa',
              icon: Icons.group,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DataSiswaScreen()),
                );
              },
            ),
            _ActionCard(
              label: 'Profil',
              icon: Icons.person,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(selectedIndex: 0),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _ActionCard({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: 150,
          height: 120,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: Colors.blueAccent),
              const SizedBox(height: 12),
              Text(
                label,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
