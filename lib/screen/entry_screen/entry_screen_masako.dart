import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_inventory_gudang/models/Masako_model.dart';
import 'package:mini_project_inventory_gudang/view_model/masako_view_model.dart';
import 'package:provider/provider.dart';

class MasakoEntryScreen extends StatefulWidget {
  static const routeName = '/masako/new';
  final Masako? masako;
  const MasakoEntryScreen({super.key, this.masako});

  @override
  State<MasakoEntryScreen> createState() => _MasakoEntryScreen();
}

class _MasakoEntryScreen extends State<MasakoEntryScreen> {

  final namaController = TextEditingController();
  final beratController = TextEditingController();
  final jumlahController = TextEditingController();
  final produksiController = TextEditingController();
  final expiredController = TextEditingController();

  @override
  void initState(){
    super.initState();
    if(widget.masako != null) {
      final data = widget.masako!;
      namaController.text = data.nama ?? '';
      beratController.text = data.berat ?? '';
      jumlahController.text = data.jumlah ?? '';
      produksiController.text = data.tanggalProduksi ?? '';
      expiredController.text = data.tanggalExpired ?? '';
    }
  }

  Future<void> _submitDataMasako() async {
    if (namaController.text.isEmpty || 
        beratController.text.isEmpty ||
        jumlahController.text.isEmpty ||
        produksiController.text.isEmpty ||
        expiredController.text.isEmpty) {
      return;    
    }

    final nama = namaController.text;
    final berat = beratController.text;
    final jumlah = jumlahController.text;
    final tanggalProduksi = produksiController.text;
    final tanggalExpired = expiredController.text;

    try {
      if (widget.masako != null) {
        final data = widget.masako!;
        final updateMasakoData = Masako(
          id: data.id, 
          nama: nama, 
          berat: berat, 
          jumlah: jumlah, 
          tanggalProduksi: tanggalProduksi, 
          tanggalExpired: tanggalExpired
        );

        await Provider.of<MasakoViewModel>(context, listen: false).updateMasako(updateMasakoData);
      } else {
        final newMasako = Masako(
          nama: nama, 
          berat: berat, 
          jumlah: jumlah, 
          tanggalProduksi: tanggalProduksi, 
          tanggalExpired: tanggalExpired);

          await Provider.of<MasakoViewModel>(context, listen: false).addMasako(newMasako);
      }
    } catch (error) {
      return;
    }
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }



  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.3,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    // padding: const EdgeInsets.only(left: 40, right: 20, bottom: 20),
                    height: size.height * 0.3 - 40,
                    decoration: const BoxDecoration(
                      // color: Color.fromARGB(255, 116, 178, 181),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [
                          Color.fromARGB(255, 21, 135, 105),
                          Color.fromARGB(255, 48, 160, 143),
                          Color.fromARGB(255, 121, 195, 185),
                        ]
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 87, 178, 183),
                          spreadRadius: 2,
                          blurRadius: 15,
                          offset: Offset(0, 3)
                        )
                      ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(height: 65,),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Tambah Produk', style: GoogleFonts.poppins(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                              Text('Masako', style: GoogleFonts.poppins(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        prefixIcon: const Icon(
                          Icons.inventory_2,
                          color: Color.fromARGB(255, 48, 160, 143),
                        ),
                        hintText: 'Nama Produk',
                        hintStyle: const TextStyle(color: Color.fromARGB(255, 48, 160, 143)),
                      ),
                      controller: namaController,
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (value) => _submitDataMasako(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        prefixIcon: const Icon(
                          Icons.note_add_outlined,
                          color: Color.fromARGB(255, 48, 160, 143),
                        ),
                        hintText: 'Berat Bersih Produk',
                        hintStyle: const TextStyle(color: Color.fromARGB(255, 48, 160, 143)),
                      ),
                      controller: beratController,
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (value) => _submitDataMasako(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        prefixIcon: const Icon(
                          Icons.add_circle_outline_rounded,
                          color: Color.fromARGB(255, 48, 160, 143),
                        ),
                        hintText: 'Jumlah Produk',
                        hintStyle: const TextStyle(color:Color.fromARGB(255, 48, 160, 143)),
                      ),
                      controller: jumlahController,
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (value) => _submitDataMasako()
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        prefixIcon: const Icon(
                          Icons.date_range,
                          color: Color.fromARGB(255, 48, 160, 143),
                        ),
                        hintText: 'Tanggal Produksi Produk',
                        hintStyle: const TextStyle(color: Color.fromARGB(255, 48, 160, 143)),
                      ),
                      controller: produksiController,
                      keyboardType: TextInputType.datetime,
                      onFieldSubmitted: (value) => _submitDataMasako()
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 48, 160, 143)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        prefixIcon: const Icon(
                          Icons.date_range,
                          color: Color.fromARGB(255, 48, 160, 143),
                        ),
                        hintText: 'Tanggal Expired Produk',
                        hintStyle: const TextStyle(color: Color.fromARGB(255, 48, 160, 143)),
                      ),
                      controller: expiredController,
                      keyboardType: TextInputType.datetime,
                      onFieldSubmitted: (value) => _submitDataMasako()
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: _submitDataMasako, 
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 48, 160, 143)),
                        ),
                        child: const Text('Tambahkan Produk', style: TextStyle(fontSize: 15),)
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}