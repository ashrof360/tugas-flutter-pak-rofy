import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/rapor_provider.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _pwd = TextEditingController();
  String _role = 'Guru';

  void _submit() {
    if (_email.text.isEmpty || _pwd.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Isi email dan password')));
      return;
    }

    // mock login: accept any
    Provider.of<RaporProvider>(
      context,
      listen: false,
    ).loginAs(name: _email.text.split('@').first, role: _role);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => DashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(size: 80),
              const SizedBox(height: 12),
              const Text(
                'RaporKu',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 18),
              TextField(
                controller: _email,
                decoration: const InputDecoration(
                  labelText: 'Email / Username',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _pwd,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _role,
                items: const [
                  DropdownMenuItem(value: 'Guru', child: Text('Guru')),
                  DropdownMenuItem(value: 'Siswa', child: Text('Siswa')),
                  DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                ],
                onChanged: (v) => setState(() => _role = v ?? 'Guru'),
                decoration: const InputDecoration(labelText: 'Role'),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  child: const Text('Masuk'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
