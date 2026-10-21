import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo ListView',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo ListView'),
          backgroundColor: Colors.amber,
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            listTile(
              Colors.blueAccent.shade400,
              Colors.greenAccent.shade400,
              'Kehadiran',
              'Presensi kehadiran kuliah',
              'assets/icons/boy.png',
            ),
            listTile(
              Colors.greenAccent.shade400,
              Colors.blueAccent.shade400,
              'Jadwal',
              'Jadwal perkuliahan',
              'assets/icons/timetable.jpeg',
            ),
            listTile(
              Colors.yellowAccent.shade400,
              Colors.redAccent.shade400,
              'Tugas',
              'Tugas perkuliahan di luar kelas',
              'assets/icons/homeschooling.jpeg',
            ),
            listTile(
              Colors.redAccent.shade400,
              Colors.amberAccent.shade400,
              'Pengumuman',
              'Informasi terkait perkuliahan',
              'assets/icons/clipboard.jpeg',
            ),
            listTile(
              Colors.purpleAccent.shade400,
              Colors.tealAccent.shade400,
              'Nilai',
              'Nilai ujian dan tugas',
              'assets/icons/marks.jpeg',
            ),
            listTile(
              Colors.tealAccent.shade400,
              Colors.purpleAccent.shade400,
              'Catatan',
              'Pengingat kegiatan perkuliahan',
              'assets/icons/pencil.jpeg',
            ),
          ],
        ),
      ),
    );
  }
}

Container listTile(
  Color warna,
  Color warnaAvatar,
  String judul,
  String subjudul,
  String gambar,
) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: ListTile(
      tileColor: warna,
      title: Text(
        judul,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subjudul, style: const TextStyle(fontSize: 16)),
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: warnaAvatar,
        child: Image.asset(gambar, width: 35, height: 35),
      ),
      trailing: Icon(Icons.star, color: Colors.orangeAccent.shade400),
    ),
  );
}
