import 'package:flutter/material.dart';
import 'package:uas/api_service.dart';
import 'package:uas/models/produk_model.dart';

class ProdukListScreen extends StatefulWidget {
  @override
  _ProdukListScreenState createState() => _ProdukListScreenState();
}

class _ProdukListScreenState extends State<ProdukListScreen> {
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kunjungan'),
      ),
      body: FutureBuilder<List<Products>>(
        future: _apiService.getProduk(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text('Tidak ada data Kunjungan.'),
              );
            } else {
              List<Products> produkList = snapshot.data!;
              return ListView.builder(
                itemCount: produkList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ExpansionTile(
                      title: Text(produkList[index].nama),
                      subtitle: Text('ID: ${produkList[index].id}'),
                      children: [
                        ListTile(
                          title: Text('Gender: ${produkList[index].id}'),
                        ),
                        ListTile(
                          title: Text('Alamat: ${produkList[index].nama}'),
                        ),
                        ListTile(
                          title:
                              Text('Pekerjaan: ${produkList[index].email}'),
                        ),
                        ListTile(
                          title: Text('Email: ${produkList[index].no_hp}'),
                        ),
                        ListTile(
                          title: Text(
                              'Tanggal Lahir: ${produkList[index].tgl_janji}'),
                        ),
                        ListTile(
                          title: Text('Gambar: ${produkList[index].umur}'),
                        ),
                        ListTile(
                          title: Text('Gambar: ${produkList[index].dentist}'),
                        ),
                        ListTile(
                          title: Text(
                              'Created At: ${produkList[index].createdAt}'),
                        ),
                        ListTile(
                          title: Text(
                              'Updated At: ${produkList[index].updatedAt}'),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
