import 'package:flutter/material.dart';

class DataGuruPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nipController = TextEditingController();
  final TextEditingController _mapelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data Guru'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _nipController,
              decoration: InputDecoration(
                labelText: 'NIP',
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
                // Simulate saving teacher data
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Data guru berhasil disimpan!')),
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