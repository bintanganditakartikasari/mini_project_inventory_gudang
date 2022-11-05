import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_inventory_gudang/models/ajinomoto_model.dart';

class AjinomotoProduk extends StatelessWidget {
  final Ajinomoto dataAjinomoto;
   const AjinomotoProduk(this.dataAjinomoto, {Key? key}) : super(key: key);
   
     @override
     Widget build(Object context) {
    return Container(
      height: 170,
      padding: const EdgeInsets.all(10),
      margin:  const EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromARGB(255, 48, 160, 143), width: 2),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama Produk: ${dataAjinomoto.nama}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),),
                  Text('Berat Produk: ${dataAjinomoto.berat}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),),
                  Text('Jumlah Produk: ${dataAjinomoto.jumlah}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),),
                  Text('Tanggal Produksi Produk: ${dataAjinomoto.tanggalProduksi}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),),
                  Text('Tanggal Expired Produk: ${dataAjinomoto.tanggalExpired}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){},
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 48, 160, 143),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Icon(
                      Icons.delete, 
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 48, 160, 143),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Icon(
                      Icons.edit, 
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}