import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/rapor_provider.dart';

import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/input_nilai_screen.dart';
import 'screens/data_siswa_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const RaporApp());
}

class RaporApp extends StatelessWidget {
  const RaporApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RaporProvider(),
      child: MaterialApp(
        title: 'RaporKu',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
        ),
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const LoginScreen(),
          '/dashboard': (context) => const DashboardScreen(),
          '/input-nilai': (context) => const InputNilaiScreen(),
          '/data-siswa': (context) => const DataSiswaScreen(),
          '/profile': (context) => const ProfileScreen(),
        },
      ),
    );
  }
}
