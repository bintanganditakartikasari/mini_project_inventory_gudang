import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_inventory_gudang/models/ajinomoto_model.dart';
import 'package:mini_project_inventory_gudang/view_model/ajinomoto_view_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AjinomotoEntryScreen extends StatefulWidget {
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

  DateTime selectDateExpired = DateTime.now();
  final currentDateExpired = DateTime.now();

  DateTime selectDateProduksi = DateTime.now();
  final currentDateProduksi = DateTime.now();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
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
                                labelText: 'Nama Produk',
                                labelStyle: const TextStyle(color: Color.fromARGB(255, 48, 160, 143)),
                                hintText: 'Nama Produk',
                                hintStyle: const TextStyle(color: Color.fromARGB(255, 48, 160, 143)),
                              ),
                              controller: namaController,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null) {
                                  return 'Tidak boleh kosong';
                                }
                                return null;
                              },
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
                                labelText: 'Berat Bersih Produk',
                                labelStyle: const TextStyle(color: Color.fromARGB(255, 48, 160, 143)),
                                hintText: 'Berat Bersih Produk',
                                hintStyle: const TextStyle(color: Color.fromARGB(255, 48, 160, 143)),
                              ),
                              controller: beratController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null) {
                                  return 'Tidak boleh kosong';
                                }
                                return null;
                              },
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
                                labelText: 'Jumlah Produk',
                                labelStyle: const TextStyle(color: Color.fromARGB(255, 48, 160, 143)),
                                hintText: 'Jumlah Produk',
                                hintStyle: const TextStyle(color:Color.fromARGB(255, 48, 160, 143)),
                              ),
                              controller: jumlahController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null) {
                                  return 'Tidak boleh kosong';
                                }
                                return null;
                              },
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
                                labelText: 'Tanggal Produksi Produksi',
                                labelStyle: const TextStyle(color: Color.fromARGB(255, 48, 160, 143)),
                                hintText: DateFormat('dd-MM-yyyy').format(selectDateProduksi),
                                hintStyle: const TextStyle(color: Color.fromARGB(255, 48, 160, 143)),
                              ),
                              controller: produksiController,
                              keyboardType: TextInputType.datetime,
                              validator: (value) {
                                if (value == null) {
                                  return 'Tidak boleh kosong';
                                }
                                return null;
                              },
                              onTap: () async {
                                final selectedDateProduksi = await showDatePicker(
                                  context: context,
                                  initialDate: selectDateProduksi,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000),
                                );
                                if (selectedDateProduksi != null) {
                                  setState(() {
                                  selectDateProduksi = selectedDateProduksi;
                                  produksiController.text = DateFormat('dd-MM-yyyy').format(selectDateProduksi);
                                });
                              }},
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
                                labelText: 'Tanggal Expired Produksi',
                                labelStyle: const TextStyle(color: Color.fromARGB(255, 48, 160, 143)),
                                hintText: DateFormat('dd-MM-yyyy').format(selectDateExpired),
                                hintStyle: const TextStyle(color: Color.fromARGB(255, 48, 160, 143)),
                              ),
                              controller: expiredController,
                              keyboardType: TextInputType.datetime,
                              validator: (value) {
                                if (value == null) {
                                  return 'Tidak boleh kosong';
                                }
                                return null;
                              },
                              onTap: () async {
                                final selectedDateExpired = await showDatePicker(
                                  context: context,
                                  initialDate: selectDateExpired,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000),
                                );
                                if (selectedDateExpired != null) {
                                  setState(() {
                                  selectDateExpired = selectedDateExpired;
                                  expiredController.text = DateFormat('dd-MM-yyyy').format(selectDateExpired);
                                });
                              }
                            },
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () async {
                                if(formKey.currentState!.validate()) {
                                  final ajinomoto = Provider.of<AjinomotoViewModel>(context, listen: false);
                                  Ajinomoto ajinomotoData = Ajinomoto(
                                    nama: namaController.text, 
                                    berat: beratController.text, 
                                    jumlah: jumlahController.text, 
                                    tanggalProduksi: produksiController.text, 
                                    tanggalExpired: expiredController.text
                                  );
                                  await ajinomoto.addAjinomoto(ajinomotoData);
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).pop();
                                }
                              }, 
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 48, 160, 143)),
                              ),
                              child: const Text('Tambahkan Produk', style: TextStyle(fontSize: 15),)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}