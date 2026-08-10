import 'package:flutter/material.dart';
import 'user_add_page.dart';

class AdminUserManagement extends StatefulWidget {
  const AdminUserManagement({super.key});

  @override
  State<AdminUserManagement> createState() => _AdminUserManagementState();
}

class _AdminUserManagementState extends State<AdminUserManagement> {
  final List<String> users = ["User1", "User2", "User3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Admin User Management"))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    //listtile widget ı kullanarak her bir kullanıcıyı listeledik ve bu widget ın içinde leading, title ve trailing özelliklerini kullandık.
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                    ), //leading kısmında kullanıcı sırasını göstermek için CircleAvatar kullandık.
                    title: Text(
                      users[index],
                    ), //title kısmında kullanıcı adını gösterdik.
                    trailing: Row(
                      //trailing kısmında ise düzenleme ve silme butonlarını ekledik. trailing kısmında row widgetı kullanarak sağ tarafa ekledik.
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

            IconButton( // + butonuna tıkladığımızda Navigator.push ile bizi UserAddPage sayfasına yönlendiriyor.
              icon: const Icon(Icons.add, color: Colors.deepPurple),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserAddPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
