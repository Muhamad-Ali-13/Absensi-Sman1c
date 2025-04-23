import 'package:flutter/material.dart';

class DataJadwalPage extends StatelessWidget {
  final TextEditingController _hariController = TextEditingController();
  final TextEditingController _jamController = TextEditingController();
  final TextEditingController _mapelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data Jadwal'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _hariController,
              decoration: InputDecoration(
                labelText: 'Hari',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _jamController,
              decoration: InputDecoration(
                labelText: 'Jam',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _mapelController,
              decoration: InputDecoration(
                labelText: 'Mata Pelajaran',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate saving schedule data
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Data jadwal berhasil disimpan!')),
                );
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}