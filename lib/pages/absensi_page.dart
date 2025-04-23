import 'package:flutter/material.dart';

class AbsensiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Halaman Absensi',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Absensi berhasil dicatat!')),
              );
            },
            child: Text('Catat Absensi'),
          ),
        ],
      ),
    );
  }
}