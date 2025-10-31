import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/rapor_provider.dart';
import '../models/student.dart';
import '../widgets/bottom_nav.dart';

class DataSiswaScreen extends StatefulWidget {
  const DataSiswaScreen({Key? key}) : super(key: key);

  @override
  State<DataSiswaScreen> createState() => _DataSiswaScreenState();
}

class _DataSiswaScreenState extends State<DataSiswaScreen> {
  final _search = TextEditingController();

  void _addStudent(BuildContext ctx) {
    final _name = TextEditingController();
    showDialog(
      context: ctx,
      builder: (c) {
        return AlertDialog(
          title: const Text('Tambah Siswa'),
          content: TextField(
            controller: _name,
            decoration: const InputDecoration(labelText: 'Nama'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(c),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                final val = _name.text.trim();
                if (val.isNotEmpty) {
                  final rp = Provider.of<RaporProvider>(context, listen: false);
                  rp.addStudent(
                    Student(
                      id: 's${rp.students.length + 1}',
                      name: val,
                      nis: (10000 + rp.students.length).toString(),
                    ),
                  );
                  Navigator.pop(c);
                }
              },
              child: const Text('Tambah'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final rp = Provider.of<RaporProvider>(context);
    final query = _search.text.toLowerCase();
    final filtered = rp.students
        .where(
          (s) => s.name.toLowerCase().contains(query) || s.nis.contains(query),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Data Siswa')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _search,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Cari siswa...',
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (ctx, i) {
                  final s = filtered[i];
                  return ListTile(
                    leading: CircleAvatar(child: Text(s.name[0])),
                    title: Text(s.name),
                    subtitle: Text('NIS: ${s.nis}'),
                    trailing: Text(s.average.toStringAsFixed(1)),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _addStudent(context),
                child: const Text('TAMBAH SISWA'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(selectedIndex: 3),
    );
  }
}
