import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Grid View',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo Grid View'),
          backgroundColor: Colors.amber,
        ),
        body: GridView(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            tile(
              Colors.blueAccent.shade400,
              'assets/icons/boy.png',
              'Kehadiran',
            ),
            tile(
              Colors.greenAccent.shade400,
              'assets/icons/timetable.jpeg',
              'Jadwal Kuliah',
            ),
            tile(
              Colors.yellowAccent.shade400,
              'assets/icons/homeschooling.jpeg',
              'Tugas',
            ),
            tile(
              Colors.redAccent.shade400,
              'assets/icons/clipboard.jpeg',
              'Pengumuman',
            ),
            tile(
              Colors.purpleAccent.shade400,
              'assets/icons/marks.jpeg',
              'Nilai',
            ),
            tile(
              Colors.tealAccent.shade400,
              'assets/icons/pencil.jpeg',
              'Catatan',
            ),
          ],
        ),
      ),
    );
  }
}

ClipRRect tile(Color warnaKotak, String gambar, String judul) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Container(
      color: warnaKotak,
      child: GridTile(
        footer: SizedBox(
          height: 45,
          child: GridTileBar(
            backgroundColor: Colors.black38,
            title: Text(
              judul,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        child: Image.asset(gambar, scale: 4),
      ),
    ),
  );
}
