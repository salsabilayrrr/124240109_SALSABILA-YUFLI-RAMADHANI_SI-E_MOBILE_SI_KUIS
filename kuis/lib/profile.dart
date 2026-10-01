import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  final VoidCallback?
  onMenuTap; // Fungsi untuk pindah ke tab Menu kalo emang ad acard terus pindah


  const ProfilePage({super.key, this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),

          // 1. Foto Profil / Avatar
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(Icons.person, size: 60, color: Colors.blue),
          ),

          const SizedBox(height: 16),
          // 2. Nama Pembuat
          //ini pake nama
          const Text(
              'Salsabila Yufli Ramadhani',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
            ),

          const SizedBox(height: 4),
          //3. Peran
          const Text(
            'Pemilik Toko Alat Tulis ',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),

          const SizedBox(height: 40),
          //4. Kartu Menu 1: Toko Alat Tulis
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.restaurant_menu, color: Colors.blue),
              ),

              title: Text(
                'Toko Alat Tulis',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              subtitle: const Text(
                'Kelola stok dan harga barang dagangan Anda',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),

              onTap: onMenuTap,
            ),
          ),

          const SizedBox(height: 16),
          // 5. Kartu Menu 2: Barang Unggulan
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.receipt_long, color: Colors.lightBlue),
              ),
              title: const Text(
                'Barang Unggulan',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: const Text(
                'Pulpen, Buku Tulis, dan Pensil',
                style: TextStyle(color: Colors.blueGrey, fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
