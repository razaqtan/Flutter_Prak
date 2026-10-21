import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexible',
      home: Scaffold(
        appBar: AppBar(title: const Text('Flexible')),
        body: const Center(
          child: Row(
            children: [
              Flexible(fit: FlexFit.tight, child: KotakBiruJempolKecil()),
              Flexible(fit: FlexFit.tight, child: KotakBiruJempolKecil()),
              Flexible(fit: FlexFit.loose, child: KotakBiruJempolKecil()),
            ],
          ),
        ),
      ),
    );
  }
}

class KotakBiruJempolKecil extends StatelessWidget {
  const KotakBiruJempolKecil({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Icons.thumb_up, color: Colors.white, size: 40),
    );
  }
}
