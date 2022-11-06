import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_inventory_gudang/models/ajinomoto_model.dart';
import 'package:mini_project_inventory_gudang/view_model/ajinomoto_view_model.dart';
import 'package:provider/provider.dart';

class AjinomotoEntryScreen extends StatefulWidget {
  static const routeName = '/ajinomoto/new';
  final Ajinomoto? ajinomoto;

  const AjinomotoEntryScreen({super.key, this.ajinomoto});

  @override
  State<AjinomotoEntryScreen> createState() => _AjinomotoEntryScreen();
}

class _AjinomotoEntryScreen extends State<AjinomotoEntryScreen> {

  final namaController = TextEditingController();
  final beratController = TextEditingController();
  final jumlahController = TextEditingController();
  final produksiController = TextEditingController();
  final expiredController = TextEditingController();

  // late DatabaseReference dbRefAjinomoto;

  // @override
  // void initState(){
  //   super.initState();
  //   dbRefAjinomoto = FirebaseDatabase.instance.ref().child('Ajinomoto');
  // }

  @override
  void initState(){
    super.initState();
    if(widget.ajinomoto != null) {
      final data = widget.ajinomoto!;
      namaController.text = data.nama ?? '';
      beratController.text = data.berat ?? '';
      jumlahController.text = data.jumlah ?? '';
      produksiController.text = data.tanggalProduksi ?? '';
      expiredController.text = data.tanggalExpired ?? '';
    }
  }

  Future<void> _submitDataAjinomoto() async {
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
      if (widget.ajinomoto != null) {
        final data = widget.ajinomoto!;
        final updateAjinomotoData = Ajinomoto(
          id: data.id, 
          nama: nama, 
          berat: berat, 
          jumlah: jumlah, 
          tanggalProduksi: tanggalProduksi, 
          tanggalExpired: tanggalExpired
        );

        await Provider.of<AjinomotoViewModel>(context, listen: false).updateAjinomoto(updateAjinomotoData);
      } else {
        final newAjinomoto = Ajinomoto(
          nama: nama, 
          berat: berat, 
          jumlah: jumlah, 
          tanggalProduksi: tanggalProduksi, 
          tanggalExpired: tanggalExpired);

          await Provider.of<AjinomotoViewModel>(context, listen: false).addAjinomoto(newAjinomoto);
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
                              Text('Ajinomoto', style: GoogleFonts.poppins(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),),
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
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      controller: namaController,
                      onFieldSubmitted: (value) => _submitDataAjinomoto(),
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
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      controller: beratController,
                      onFieldSubmitted: (value) => _submitDataAjinomoto(),
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
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      controller: jumlahController,
                      onFieldSubmitted: (value) => _submitDataAjinomoto(),
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
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      controller: produksiController,
                      onFieldSubmitted: (value) => _submitDataAjinomoto(),
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
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      controller: expiredController,
                      onFieldSubmitted: (value) => _submitDataAjinomoto(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: _submitDataAjinomoto,
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