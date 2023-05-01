import 'package:flutter/material.dart';

class AppExpansionTile extends StatelessWidget {
  final String title, subtitle;
  const AppExpansionTile({super.key, required this.title, required this.subtitle, });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          title: Text(title),
         children:[  Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                subtitle,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
         ]
        ),
        Divider()
      ],
    );
  }
}
