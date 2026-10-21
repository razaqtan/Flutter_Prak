import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MataKuliah {
  String kode;
  String nama;
  int sks;
  String dosen;

  MataKuliah({
    required this.kode,
    required this.nama,
    required this.sks,
    required this.dosen,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daftar Mata Kuliah',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MataKuliahPage(),
    );
  }
}

class MataKuliahPage extends StatefulWidget {
  const MataKuliahPage({super.key});

  @override
  State<MataKuliahPage> createState() => _MataKuliahPageState();
}

class _MataKuliahPageState extends State<MataKuliahPage> {
  final List<MataKuliah> _dataMataKuliah = [
    MataKuliah(
      kode: 'IF101',
      nama: 'Mobile Programming',
      sks: 3,
      dosen: 'Bapak Ahmad',
    ),
    MataKuliah(
      kode: 'IF102',
      nama: 'Pemrograman Berorientasi Objek',
      sks: 3,
      dosen: 'Ibu Siti',
    ),
    MataKuliah(
      kode: 'IF103',
      nama: 'Data Science',
      sks: 4,
      dosen: 'Bapak Budi',
    ),
    MataKuliah(
      kode: 'IF104',
      nama: 'Artificial Intelligence',
      sks: 2,
      dosen: 'Ibu Dewi',
    ),
  ];

  String _keyword = '';
  int? _filterSks;

  List<MataKuliah> get _dataTampil {
    return _dataMataKuliah.where((mk) {
      final keyword = _keyword.toLowerCase();

      final cocokPencarian =
          mk.kode.toLowerCase().contains(keyword) ||
          mk.nama.toLowerCase().contains(keyword) ||
          mk.dosen.toLowerCase().contains(keyword);

      final cocokFilter = _filterSks == null || mk.sks == _filterSks;

      return cocokPencarian && cocokFilter;
    }).toList();
  }

  int get _totalSks {
    return _dataTampil.fold(0, (total, mk) => total + mk.sks);
  }

  double get _rataRataSks {
    if (_dataTampil.isEmpty) return 0;

    return _totalSks / _dataTampil.length;
  }

  void _tambahData() {
    _showFormDialog();
  }

  void _editData(MataKuliah mataKuliah) {
    _showFormDialog(mataKuliah: mataKuliah);
  }

  void _hapusData(MataKuliah mataKuliah) {
    setState(() {
      _dataMataKuliah.remove(mataKuliah);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${mataKuliah.nama} berhasil dihapus')),
    );
  }

  Future<void> _konfirmasiHapus(MataKuliah mataKuliah) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: Text('Hapus mata kuliah ${mataKuliah.nama}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext, false);
              },
              child: const Text('Tidak'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(dialogContext, true);
              },
              child: const Text('Ya'),
            ),
          ],
        );
      },
    );

    if (result == true && mounted) {
      _hapusData(mataKuliah);
    }
  }

  void _urutNamaAZ() {
    setState(() {
      _dataMataKuliah.sort((a, b) => a.nama.compareTo(b.nama));
    });
  }

  void _urutNamaZA() {
    setState(() {
      _dataMataKuliah.sort((a, b) => b.nama.compareTo(a.nama));
    });
  }

  void _urutSksKecilBesar() {
    setState(() {
      _dataMataKuliah.sort((a, b) => a.sks.compareTo(b.sks));
    });
  }

  void _urutSksBesarKecil() {
    setState(() {
      _dataMataKuliah.sort((a, b) => b.sks.compareTo(a.sks));
    });
  }

  void _showPilihanSorting() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.sort_by_alpha),
                title: const Text('Nama A-Z'),
                onTap: () {
                  Navigator.pop(context);
                  _urutNamaAZ();
                },
              ),
              ListTile(
                leading: const Icon(Icons.sort_by_alpha),
                title: const Text('Nama Z-A'),
                onTap: () {
                  Navigator.pop(context);
                  _urutNamaZA();
                },
              ),
              ListTile(
                leading: const Icon(Icons.arrow_upward),
                title: const Text('SKS Kecil ke Besar'),
                onTap: () {
                  Navigator.pop(context);
                  _urutSksKecilBesar();
                },
              ),
              ListTile(
                leading: const Icon(Icons.arrow_downward),
                title: const Text('SKS Besar ke Kecil'),
                onTap: () {
                  Navigator.pop(context);
                  _urutSksBesarKecil();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showFormDialog({MataKuliah? mataKuliah}) {
    final kodeController = TextEditingController(text: mataKuliah?.kode ?? '');

    final namaController = TextEditingController(text: mataKuliah?.nama ?? '');

    final sksController = TextEditingController(
      text: mataKuliah?.sks.toString() ?? '',
    );

    final dosenController = TextEditingController(
      text: mataKuliah?.dosen ?? '',
    );

    final isEdit = mataKuliah != null;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(isEdit ? 'Edit Mata Kuliah' : 'Tambah Mata Kuliah'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: kodeController,
                  decoration: const InputDecoration(
                    labelText: 'Kode Mata Kuliah',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: namaController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Mata Kuliah',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: sksController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'SKS',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: dosenController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Dosen',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Batal'),
            ),
            FilledButton(
              onPressed: () {
                final kode = kodeController.text.trim();
                final nama = namaController.text.trim();
                final sks = int.tryParse(sksController.text.trim()) ?? 0;
                final dosen = dosenController.text.trim();

                if (kode.isEmpty || nama.isEmpty || dosen.isEmpty || sks <= 0) {
                  return;
                }

                setState(() {
                  if (isEdit) {
                    mataKuliah.kode = kode;
                    mataKuliah.nama = nama;
                    mataKuliah.sks = sks;
                    mataKuliah.dosen = dosen;
                  } else {
                    _dataMataKuliah.add(
                      MataKuliah(
                        kode: kode,
                        nama: nama,
                        sks: sks,
                        dosen: dosen,
                      ),
                    );
                  }
                });

                Navigator.pop(dialogContext);
              },
              child: Text(isEdit ? 'Update' : 'Simpan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = _dataTampil;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Mata Kuliah'),
        actions: [
          IconButton(
            tooltip: 'Urutkan',
            onPressed: _showPilihanSorting,
            icon: const Icon(Icons.sort),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _tambahData,
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Cari Mata Kuliah',
                hintText: 'Kode, nama, atau dosen',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _keyword = value;
                });
              },
            ),

            const SizedBox(height: 12),

            DropdownButtonFormField<int?>(
              value: _filterSks,
              decoration: const InputDecoration(
                labelText: 'Filter SKS',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem<int?>(value: null, child: Text('Semua')),
                DropdownMenuItem<int?>(value: 2, child: Text('2 SKS')),
                DropdownMenuItem<int?>(value: 3, child: Text('3 SKS')),
                DropdownMenuItem<int?>(value: 4, child: Text('4 SKS')),
              ],
              onChanged: (value) {
                setState(() {
                  _filterSks = value;
                });
              },
            ),

            const SizedBox(height: 16),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jumlah Mata Kuliah: ${data.length}'),
                    Text('Total SKS: $_totalSks'),
                    Text(
                      'Rata-rata SKS: '
                      '${_rataRataSks.toStringAsFixed(2)}',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            Expanded(
              child: data.isEmpty
                  ? const Center(child: Text('Data tidak ditemukan'))
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final mk = data[index];

                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(child: Text('${index + 1}')),
                            title: Text(mk.nama),
                            subtitle: Text(
                              '${mk.kode}\n'
                              '${mk.sks} SKS\n'
                              'Dosen: ${mk.dosen}',
                            ),
                            isThreeLine: true,
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  tooltip: 'Edit',
                                  onPressed: () {
                                    _editData(mk);
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  tooltip: 'Hapus',
                                  onPressed: () {
                                    _konfirmasiHapus(mk);
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
