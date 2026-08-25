import 'package:flutter/material.dart';
import 'package:flutter_deneme/features/users/user_edit_page.dart';
import 'package:provider/provider.dart';
import '../users/user_provider.dart';
import '../users/user_add_page.dart';
import '../../core/localization/app_strings.dart';

class AdminUserManagement extends StatelessWidget {
  const AdminUserManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      color: Color.fromARGB(255, 215, 207, 191),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                          backgroundColor: Color.fromARGB(255, 193, 169, 139),
                        ),
                        title: Text(user.username),
                        subtitle: Text(user.userTitle),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Color.fromARGB(255, 135, 114, 89),
                              ),
                              onPressed: () async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UserEditPage(user: user),
                                  ),
                                );
                                if (result == true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        AppStrings.tr(context, 'snack1'),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Color.fromARGB(255, 135, 114, 89),
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text(
                                        AppStrings.tr(context, 'delete'),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            provider.deleteUser(user.id);
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            AppStrings.tr(context, 'yes'),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            AppStrings.tr(context, 'no'),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
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
          IconButton(
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
    );
  }
}
