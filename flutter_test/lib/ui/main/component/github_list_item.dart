import 'package:flutter/material.dart';

class GithubListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(''),
            radius: 30,
            backgroundColor: Colors.grey[300],
          ),
          SizedBox(width: 12),
          Text(
            'Hello',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
