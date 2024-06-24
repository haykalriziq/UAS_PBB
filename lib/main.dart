import 'package:flutter/material.dart';
import 'package:uas/produk_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mahkota Gigi',
      theme: ThemeData(
        primaryColor: Colors.teal,
        hintColor: Colors.tealAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mahkota Gigi',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal.withOpacity(0.3),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade300, Colors.teal.shade800],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Selamat Datang di Mahkota Gigi!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 30),
              _buildAnimatedCard(
                icon: Icons.calendar_today,
                text: 'Jadwal Kunjungan',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProdukListScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedCard({
    required IconData icon,
    required String text,
    required Function() onTap,
  }) {
    return Container(
      width: 300,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.tealAccent.withOpacity(0.3),
        child: Row(
          children: [
            SizedBox(width: 20),
            Icon(icon, color: Colors.tealAccent, size: 40),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.tealAccent),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}