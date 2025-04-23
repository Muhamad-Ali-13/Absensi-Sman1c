import 'package:flutter/material.dart';

class LaporanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Halaman Laporan',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Laporan berhasil diunduh!')),
              );
            },
            child: Text('Unduh Laporan'),
          ),
        ],
      ),
    );
  }
}