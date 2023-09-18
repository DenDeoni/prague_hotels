import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prague_hotels/pages/hotel_detail_page.dart';
import 'package:prague_hotels/pages/hotel_list_page.dart';
import 'package:prague_hotels/utils/constants.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titleApp,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  late bool isSomeHotelViewed = false;

  final box = GetStorage();

  void _onItemTapped(int index) async {
    isSomeHotelViewed = box.hasData(hotelId);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pagesWidget = <Widget>[
      HotelListPage(),
      isSomeHotelViewed == true ? const HotelDetailPage() : const Text(noHotelViewed),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          titleApp,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: pagesWidget.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: hotels,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_quilt_outlined),
            label: lastViewed,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
