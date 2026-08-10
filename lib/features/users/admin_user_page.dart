import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../users/user_provider.dart';
import '../../data/models/user_model.dart';
import '../users/user_add_page.dart';

class AdminUserManagement extends StatelessWidget {
  const AdminUserManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Admin User Management"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Consumer<UserProvider>(
                builder: (context, provider, child) {
                  final users = provider.users;

                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];

                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text("${index + 1}"),
                          ),
                          title: Text(user.username),
                          subtitle: Text(user.userTitle),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            IconButton(// + butonuna tıkladığımızda Navigator.push ile bizi UserAddPage sayfasına yönlendiriyor.
              icon: const Icon(
                Icons.add,
                color: Colors.deepPurple,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserAddPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}