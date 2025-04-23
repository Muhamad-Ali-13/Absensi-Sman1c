import 'package:flutter/material.dart';

class LaporanAbsensiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan Absensi'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Laporan Absensi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Simulated data
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Nama Siswa $index'),
                    subtitle: Text('Tanggal: 2023-10-$index, Status: Hadir'),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Simulate downloading report
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Laporan absensi berhasil diunduh!')),
                );
              },
              child: Text('Unduh Laporan'),
            ),
          ],
        ),
      ),
    );
  }
}