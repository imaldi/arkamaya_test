import 'package:flutter/material.dart';

import '../../data/models/user_response.dart';

class UserTile extends StatefulWidget {
  final User user;
  const UserTile({required this.user, Key? key}) : super(key: key);

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        widget.user.avatar ?? "",
        errorBuilder: (bc, obj, st) {
          return const Icon(Icons.person);
        },
      ),
      title: Builder(builder: (context) {
        var firstName = widget.user.firstName;
        if (widget.user.firstName == null || widget.user.lastName == null) {
          firstName = widget.user.email
              ?.split("@")
              .first
              .split(".")
              .map((e) => e
                  .split("")
                  .asMap()
                  .map((key, value) => key == 0
                      ? MapEntry(key, value.toString().toUpperCase())
                      : MapEntry(key, value))
                  .values
                  .join())
              .join(" ");
        }
        return Text(firstName ?? "Al");
      }),
      subtitle: Text(widget.user.email ?? "abc@gmail.com"),
    );
  }
}
