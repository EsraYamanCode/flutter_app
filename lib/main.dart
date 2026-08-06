import 'package:flutter/material.dart';
import 'package:flutter_deneme/features/products/products_page.dart';

import 'features/users/admin_user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override //buraya appBar ve navBar ekleki o kısım kalsın sadece diğer şeyler değişsin.
  Widget build(BuildContext context) {
    var adminUserManagement = AdminUserManagement();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductsManagement(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int sayac = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Ana Sayfa"))),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              sayac++;
            });
            print("Buton tiklandi! Sayac: $sayac");
          },
          child: Text("$sayac"),
        ),
      ),
    );
  }
}

class ProfilSayfasi extends StatelessWidget {
  const ProfilSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            TextField(
              decoration: InputDecoration(
                labelText: "Kullanıcı Adı",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Şifre",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                print("Giriş yapildi!");
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

class ListePratigi extends StatefulWidget {
  const ListePratigi({super.key});

  @override
  State<ListePratigi> createState() => _ListePratigiState();
}

class _ListePratigiState extends State<ListePratigi> {
  final TextEditingController _textController = TextEditingController();
  List<String> items = ["Elma", "Armut", "Muz"];
  void _addItem() {
    if (_textController.text.isNotEmpty) {
      //eğer textfield ın içi boş değilse alıyoruz ve listeye ekliyoruz sonrasında kutuyu da temizliyoruz.
      setState(() {
        items.add(_textController.text);
        _textController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Liste Pratiği")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      labelText: "Yeni öğe ekle",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: _addItem, child: const Text("Ekle")),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(child: Text("${index + 1}")),
                      title: Text(items[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
