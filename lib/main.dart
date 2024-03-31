// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(const MyApp()); //menampilkan aplikasi/widget

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //menghilangkan tulisan debug
      //home atau scaffold terdiri dari app bar dan body
      home: Scaffold(
        appBar: AppBarSection(), //memanggil app bar
        //memanggil bagian body
        body: BodySection(),
      ),
    );
  }
}

//membuat bagian app bar
class AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSection({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(130);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //membuat bagian leading
      leading: IconButton(
        //membuat button menu
        icon: Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          print("Menu button pressed!");
        },
      ),
      //membuat bagian title
      title: const Text(
        "Halo, It's Great Day for a Coffee",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'PlayfairDisplay'),
      ),
      backgroundColor: Color.fromARGB(255, 110, 61, 4),
      //membuat bagian action
      actions: [
        IconButton(
          //membuat button notification
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            print("Notification button pressed!");
          },
        ),
        IconButton(
          icon: Icon(
            //membuat button discount
            Icons.discount,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            print("Promo button pressed!");
          },
        ),
      ],
      // Mengatur bagian bottom dari AppBar
      bottom: PreferredSize(
        //mengatur ukuran preferensi dari child
        preferredSize:
            preferredSize, //parameter untuk menerima ukuran preferensi
        //mengatur default controller untuk tabbar
        child: DefaultTabController(
          length: 2, //jumlah tab dalam tabbar
          child: Container(
            color: Colors.white,
            //widget untuk menampilkan tab yang berisi ikon dan teks
            child: TabBar(
              labelColor: Colors.brown[900],
              unselectedLabelColor: Colors.brown[55],
              //daftar tab yang akan ditampilkan dalam tabbar
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.directions_run,
                    size: 30,
                  ),
                  text: 'Pick Up',
                ),
                Tab(
                  icon: Icon(
                    Icons.delivery_dining,
                    size: 30,
                  ),
                  text: 'Delivery',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BodySection extends StatelessWidget {
  const BodySection({Key? key}) : super(key: key);

  @override
  //diadalam methid build akan mengembalikan widget column
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Widget Container di atas kolom pencarian
        Padding(
          padding: const EdgeInsets.all(8.0), //jrak disekeliling widget
          //mengatur child dalam satu baris secara vertikal
          child: Row(
            children: [
              Icon(
                Icons.place,
                size: 30,
                color: Color.fromARGB(255, 110, 61, 4),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 110, 61, 4),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(31.3),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Aksi ketika teks ditekan
                      print("Place pressed!");
                    },
                    child: Text(
                      'Bogor',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 110, 61, 4),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Kolom pencarian
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            cursorColor: Color.fromARGB(255, 110, 61, 4),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(31.3),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 110, 61, 4),
                  width: 2.0,
                ),
              ),
              prefixIcon: Icon(
                Icons.search,
                size: 30,
                color: Color.fromARGB(255, 110, 61, 4),
              ),
              hintText: "Search Coffee...",
            ),
          ),
        ),
        // Gambar dan nama kopi
        Expanded(
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildCoffeeItem(
                      name: 'Affogato',
                      price: '35.999',
                      imagePath: 'images/affogato.jpg',
                    ),
                  ),
                  Expanded(
                    child: _buildCoffeeItem(
                      name: 'Cappucino',
                      price: '24.999',
                      imagePath: 'images/cappucino.jpg',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildCoffeeItem(
                      name: 'Americano',
                      price: '20.499',
                      imagePath: 'images/americano.jpg',
                    ),
                  ),
                  Expanded(
                    child: _buildCoffeeItem(
                      name: 'Caramel Machiato',
                      price: '36.490',
                      imagePath: 'images/machhiato.jpg',
                    ),
                  ),
                ],
              ),
              // Tambahkan item kopi lainnya di sini
            ],
          ),
        ),
// Row untuk tombol "My Order" dan "My Chart "
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Aksi ketika tombol "My Order" ditekan
                  print("My Order button pressed!");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 110, 61, 4),
                  ),
                ),
                child: Text(
                  "My Order",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Aksi ketika tombol "KMy Chart " ditekan
                  print("My Chart button pressed!");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(
                        255, 110, 61, 4), // Warna coklat untuk tombol My Chart
                  ),
                ),
                child: Text(
                  "My Chart ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCoffeeItem({
    required String name,
    required String price,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menampilkan gambar itek kopi
          Image.asset(
            imagePath,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  // Tambahkan aksi ketika tombol keranjang ditekan di sini
                  print("Add to Cart button pressed!");
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Color.fromARGB(255, 110, 61, 4),
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
