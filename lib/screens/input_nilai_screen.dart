import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/rapor_provider.dart';
import '../widgets/bottom_nav.dart';

class InputNilaiScreen extends StatefulWidget {
  const InputNilaiScreen({Key? key}) : super(key: key);

  @override
  State<InputNilaiScreen> createState() => _InputNilaiScreenState();
}

class _InputNilaiScreenState extends State<InputNilaiScreen> {
  String _subject = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final rp = Provider.of<RaporProvider>(context, listen: false);
    _subject = rp.subjects.first;
  }

  @override
  Widget build(BuildContext context) {
    final rp = Provider.of<RaporProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Input Nilai')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: _subject,
              items: rp.subjects
                  .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                  .toList(),
              onChanged: (v) => setState(() => _subject = v ?? _subject),
              decoration: const InputDecoration(labelText: 'Mapel'),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: rp.students.length,
                itemBuilder: (context, i) {
                  final s = rp.students[i];
                  final ctrl = TextEditingController(
                    text: s.grades[_subject]?.toString() ?? '',
                  );
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                s.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'NIS: ${s.nis}',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 90,
                            child: TextField(
                              controller: ctrl,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Nilai',
                              ),
                              onChanged: (v) {
                                final val = int.tryParse(v);
                                if (val != null)
                                  rp.updateGrade(
                                    studentId: s.id,
                                    subject: _subject,
                                    grade: val,
                                  );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Nilai disimpan (mock)')),
                  );
                },
                child: const Text('SIMPAN NILAI'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(selectedIndex: 1),
    );
  }
}
