import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/rapor_provider.dart';
import 'screens/login_screen.dart';

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
        home: const LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
