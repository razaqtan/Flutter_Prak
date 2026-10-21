import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row and Column Example',
      home: Scaffold(
        appBar: AppBar(title: Text('Row and Column Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // // Vertikal (Column)
              // KotakBiruJempol(),
              // SizedBox(height: 20),
              // KotakBiruJempol(),
              // SizedBox(height: 20),
              // KotakBiruJempol(),

              // SizedBox(height: 40), // Jarak antara Column dan Row
              // // Horizontal (Row)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KotakBiruJempol(),
                  SizedBox(width: 20),
                  KotakBiruJempol(),
                  SizedBox(width: 20),
                  KotakBiruJempol(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KotakBiruJempol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(Icons.thumb_up, color: Colors.white, size: 40),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Kotak Jempol 2 Grid',
//       home: Scaffold(
//         appBar: AppBar(title: Text('Kotak Love 2 Grid')),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   KotakWarnaJempol(warna: Colors.red, label: 'Merah'),
//                   SizedBox(height: 20),
//                   KotakWarnaJempol(warna: Colors.green, label: 'Hijau'),
//                   SizedBox(width: 20),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   KotakWarnaJempol(warna: Colors.blue, label: 'Biru'),
//                   SizedBox(height: 20),
//                   KotakWarnaJempol(warna: Colors.yellow, label: 'Kuning'),
//                   SizedBox(width: 20),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class KotakWarnaJempol extends StatelessWidget {
//   final Color warna;
//   final String label;

//   KotakWarnaJempol({required this.warna, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       height: 100,
//       decoration: BoxDecoration(
//         color: warna,
//         border: Border.all(color: Colors.black, width: 2),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.favorite, color: Colors.white, size: 40),
//           SizedBox(height: 8),
//           Text(label, style: TextStyle(color: Colors.white, fontSize: 16)),
//         ],
//       ),
//     );
//   }
// }
