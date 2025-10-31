import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/rapor_provider.dart';
import '../widgets/bottom_nav.dart';

class LihatRaporScreen extends StatefulWidget {
  const LihatRaporScreen({Key? key}) : super(key: key);

  @override
  State<LihatRaporScreen> createState() => _LihatRaporScreenState();
}

class _LihatRaporScreenState extends State<LihatRaporScreen> {
  String semester = 'Ganjil 2025';

  @override
  Widget build(BuildContext context) {
    final rp = Provider.of<RaporProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Lihat Rapor')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: semester,
              items: const [
                DropdownMenuItem(
                  value: 'Ganjil 2025',
                  child: Text('Ganjil 2025'),
                ),
                DropdownMenuItem(
                  value: 'Genap 2026',
                  child: Text('Genap 2026'),
                ),
              ],
              onChanged: (v) => setState(() => semester = v ?? semester),
              decoration: const InputDecoration(labelText: 'Semester'),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: rp.students.length,
                itemBuilder: (context, i) {
                  final s = rp.students[i];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            s.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          ...s.grades.entries
                              .map(
                                (e) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [Text(e.key), Text('${e.value}')],
                                ),
                              )
                              .toList(),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rata-rata: ${s.average.toStringAsFixed(1)}',
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('Unduh PDF Rapor'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(selectedIndex: 2),
    );
  }
}
