import 'package:flutter/material.dart';

class DataAbsensiPage extends StatelessWidget {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data Absensi'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _tanggalController,
              decoration: InputDecoration(
                labelText: 'Tanggal',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _statusController,
              decoration: InputDecoration(
                labelText: 'Status (Hadir/Tidak Hadir)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate saving attendance data
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Data absensi berhasil disimpan!')),
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