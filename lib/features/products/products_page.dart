import 'package:flutter/material.dart';

class ProductsManagement extends StatefulWidget {
  const ProductsManagement({super.key});

  @override
  State<ProductsManagement> createState() => _ProductsManagementState();
}

class _ProductsManagementState extends State<ProductsManagement> {
  final List<String> products = ["Product1", "Product2", "Product3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Products Management"))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(    //listtile widget ı kullanarak her bir ürünleri listeledik ve bu widget ın içinde leading, title ve trailing özelliklerini kullandık. 
                    leading: CircleAvatar(child: Text("${index + 1}")), //leading kısmında ürün sırasını göstermek için CircleAvatar kullandık.
                    title: Text(products[index]), //title kısmında ürün adını gösterdik.
                    trailing: Row(  //trailing kısmında ise düzenleme ve silme butonlarını ekledik. trailing kısmında row widgetı kullanarak sağ tarafa ekledik.
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}