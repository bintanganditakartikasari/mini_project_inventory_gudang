import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_inventory_gudang/models/ajinomoto_model.dart';

class AjinomotoProduk extends StatelessWidget {
  final Ajinomoto data;
   const AjinomotoProduk(this.data, {Key? key}) : super(key: key);
   
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
                  Text('Nama Produk: ${data.nama.toString()}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),),
                  Text('Berat Produk: ${data.berat.toString()}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),),
                  Text('Jumlah Produk: ${data.jumlah.toString()}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),),
                  Text('Tanggal Produksi Produk: ${data.tanggalProduksi.toString()}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),),
                  Text('Tanggal Expired Produk: ${data.tanggalExpired.toString()}', style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),),
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