import 'package:flutter/material.dart';

class DetailsListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? detail;

  const DetailsListTile(
      {required this.icon, required this.title, required this.detail, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
          icon,
          color: Theme
              .of(context)
              .primaryColor),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        detail ?? 'Sem informações',
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    );
  }
}
