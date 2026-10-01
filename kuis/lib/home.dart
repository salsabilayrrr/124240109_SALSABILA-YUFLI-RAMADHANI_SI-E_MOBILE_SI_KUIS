import 'package:flutter/material.dart';
import 'models/stationery_item.dart';
import 'detail.dart';

class HomePage extends StatefulWidget {
  final List<StationeryItem> stationeryList;
  const HomePage({super.key, required this.stationeryList});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // 1. Kotak Utama: Menyediakan daftar yang bisa di-scroll ke bawah
      itemCount: widget.stationeryList.length,
      itemBuilder: (context, index) {
        final food = widget.stationeryList[index];
        return Card(
          // 2. Kotak Kartu: Memberi efek tampilan kartu melayang
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          elevation: 2,
          child: ListTile(
            // 3. Kotak Baris Menu: Mengatur tata letak standar menu
            contentPadding: EdgeInsets.all(10),
            //Menampilkan gambar makanan di sebelah kiri
            leading: ClipRRect(
              // -> Isi Kiri: Gambar Alat
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                food.imageUrl,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),

            //nama alat
            title: Text(
              food.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            subtitle: Column(
              //-> Isi Bawah: Disusun ke bawah (Vertikal)
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  food.description, //-> Deskripsi 
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),

                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${food.stock} pcs tersedia', // -> Stock (di kiri)
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 2),
                        
                      ],
                    ),
                    Text(
                      'Rp ${food.price} / pcs', // -> Harga (di kanan)
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Aksi ketika item menu diklik untuk membuka halaman detail
            onTap: () {
              // 4. Aksi Sentuh: Tombol klik untuk pindah halaman
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(foodItem: food),
                  //foodItem karena sebagai penampung di detail Page bukan FoodItem yg merupakan class di food_item.dart
                ),
              ).then((_) {
                setState(() {});
              });
            },
          ),
        );
      },
    );
  }
}
