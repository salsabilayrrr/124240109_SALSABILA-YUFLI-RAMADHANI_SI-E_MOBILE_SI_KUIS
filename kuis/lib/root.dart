import 'package:flutter/material.dart';

import 'models/stationery_item.dart';
import 'home.dart';
import 'profile.dart';

class Root extends StatefulWidget {

  const Root({super.key, });

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;
  final List<StationeryItem> stationeryList = StationeryItem.sampleData;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(stationeryList: stationeryList),
      ProfilePage(
        onMenuTap: () {
          setState(() {
            _selectedIndex =
                0; // Mengubah tab aktif kembali ke Menu saat kartu diklik
          });
        },
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? 'Toko Alat Tulis' : 'Profil'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,

        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        currentIndex: _selectedIndex,

        unselectedLabelStyle: const TextStyle(fontSize: 12),
        elevation: 8, // ← Shadow effect

        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Menu',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
