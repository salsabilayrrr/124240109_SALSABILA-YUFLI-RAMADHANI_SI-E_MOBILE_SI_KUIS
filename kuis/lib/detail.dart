import 'package:flutter/material.dart';

import 'models/stationery_item.dart';

class DetailPage extends StatefulWidget {
  final StationeryItem foodItem;
  const DetailPage({super.key, required this.foodItem});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late TextEditingController _controller, _controller2;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.foodItem.stock.toString());
      _controller2 = TextEditingController(
      text: widget.foodItem.price.toString());
  }
  

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Gambar Alat (Ukuran Lebih Besar)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.foodItem.imageUrl,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),
            // 2. Nama Alat
            Text(
              widget.foodItem.name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 4),
            // 3. Harga Satuan
            Text(
              'Rp ${widget.foodItem.formattedPrice} / pcs',
              style: const TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            // 4. Deskripsi Lengkap
            const SizedBox(height: 12),
            Text(
              widget.foodItem.description,
              style: TextStyle(color: Colors.grey[700], fontSize: 14),
            ),
            const Divider(height: 32),


          //deskipsi
            const Text(
              'Deskripsi: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),

            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan Deskripsi',
              ),
              onChanged: (value) {
                setState(() {
                  // String parsedValue = String.(value)?? 0;
                  // widget.foodItem.description = parsedValue;
                });
              },
            ),    


            const SizedBox(height: 10),
            // 5. Input Jumlah Stock
            const Text(
              'Stock tersedia (pcs): ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),

            const SizedBox(height: 8),
            TextField(
              controller: _controller,
              keyboardType:
                  TextInputType.number, // Memunculkan keyboard angka di HP
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan jumlah porsi',
              ),
              onChanged: (value) {
                setState(() {
                  // a. Terjemahkan teks ketikan ke angka bulat (kalau kosong/salah, jadikan 0)
                  int parsedValue = int.tryParse(value) ?? 0;
                  // b. Masukkan angka hasil terjemahan tadi ke dalam data jumlah porsi makanan
                  widget.foodItem.stock = parsedValue;
                });
              },

            ),

          const Text(
              'Harga: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          
            const SizedBox(height: 8),
            TextField(
              controller: _controller2,
              keyboardType:
                  TextInputType.number, // Memunculkan keyboard angka di HP
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan jumlah harga',
              ),
              onChanged: (value) {
                setState(() {
                  // a. Terjemahkan teks ketikan ke angka bulat (kalau kosong/salah, jadikan 0)
                  int parsedValue = int.tryParse(value) ?? 0;
                  // b. Masukkan angka hasil terjemahan tadi ke dalam data jumlah porsi makanan
                  widget.foodItem.price = parsedValue;
                });
              },

            ),

            const SizedBox(height: 30),
            // Tombol Selesai
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Simpan Pemesanan', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
