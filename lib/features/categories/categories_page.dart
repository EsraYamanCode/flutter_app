import 'package:flutter/material.dart';

class CategoriesManagement extends StatefulWidget {
  const CategoriesManagement({super.key});

  @override
  State<CategoriesManagement> createState() => _CategoriesManagementState();
}

class _CategoriesManagementState extends State<CategoriesManagement> {
  final List<String> categories = ["Category1", "Category2", "Category3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Categories Management"))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(    //listtile widget ı kullanarak her bir kategoriyi listeledik ve bu widget ın içinde leading, title ve trailing özelliklerini kullandık. 
                    leading: CircleAvatar(child: Text("${index + 1}")), //leading kısmında kategori sırasını göstermek için CircleAvatar kullandık.
                    title: Text(categories[index]), //title kısmında kategori adını gösterdik.
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