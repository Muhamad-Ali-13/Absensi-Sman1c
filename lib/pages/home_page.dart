import 'package:flutter/material.dart';
import '../pages/data_user_page.dart'; // Import halaman DataUserPage
import '../pages/data_siswa_page.dart'; // Import halaman DataSiswaPage
import '../pages/data_guru_page.dart'; // Import halaman DataGuruPage
import '../pages/data_jadwal_page.dart'; // Import halaman DataJadwalPage
import '../pages/data_absensi_page.dart'; // Import halaman DataAbsensiPage
import '../pages/laporan_absensi_page.dart'; // Import halaman LaporanAbsensiPage
import '../widgets/category_card.dart'; // Import widget CategoryCard

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Jam Real-Time
            Container(
              width: double.infinity,
              height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: StreamBuilder<String>(
                stream: _clockStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data!,
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  } else {
                    return Text(
                      'Loading...',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                },
              ),
            ),

            SizedBox(height: 20),

            // Tombol "Jam Masuk" dan "Jam Pulang"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Jam Masuk',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Jam Pulang',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Judul "Kategori"
            Text(
              'Kategori',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            // Baris Pertama Kategori
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryCard(
                  icon: Icons.person,
                  label: 'Data User',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DataUserPage()),
                    );
                  },
                ),
                CategoryCard(
                  icon: Icons.school,
                  label: 'Data Siswa',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DataSiswaPage()),
                    );
                  },
                ),
                CategoryCard(
                  icon: Icons.people_alt,
                  label: 'Data Guru',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DataGuruPage()),
                    );
                  },
                ),
              ],
            ),

            SizedBox(height: 10),

            // Baris Kedua Kategori
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryCard(
                  icon: Icons.checklist,
                  label: 'Data Absensi',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DataAbsensiPage()),
                    );
                  },
                ),
                CategoryCard(
                  icon: Icons.schedule,
                  label: 'Data Jadwal',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DataJadwalPage()),
                    );
                  },
                ),
                CategoryCard(
                  icon: Icons.report,
                  label: 'Laporan',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LaporanAbsensiPage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Stream untuk jam real-time
  Stream<String> _clockStream() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield DateTime.now().toString().substring(10, 19);
    }
  }
}