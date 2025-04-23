import 'package:flutter/material.dart';

class DataSiswaPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nisController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data Siswa'),
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
              controller: _nisController,
              decoration: InputDecoration(
                labelText: 'NIS',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _kelasController,
              decoration: InputDecoration(
                labelText: 'Kelas',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate saving student data
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Data siswa berhasil disimpan!')),
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