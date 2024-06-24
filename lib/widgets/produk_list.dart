import 'package:flutter/material.dart';
import 'package:uas/services/api_service.dart';
import 'package:uas/models/produk_model.dart';

class ProdukList extends StatefulWidget {
  @override
  _ProdukListState createState() => _ProdukListState();
}

class _ProdukListState extends State<ProdukList> {
  List<Products> _produkList = [];

  @override
  void initState() {
    super.initState();
    _loadProduk();
  }

  _loadProduk() async {
    ApiService apiService = ApiService();
    List<Products> produkList = await apiService.getProduk();
    setState(() {
      _produkList = produkList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _produkList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(_produkList[index].nama),
            subtitle: Text(_produkList[index].dentist),
          ),
        );
      },
    );
  }
}
