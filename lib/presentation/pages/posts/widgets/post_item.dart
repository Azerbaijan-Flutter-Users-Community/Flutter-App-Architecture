import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/post.dart';
import 'action_button.dart';

final avatarColors = <int, Color>{
  1: Colors.red,
  2: Colors.teal,
  3: Colors.yellow,
  4: Colors.amber,
  5: Colors.blue,
  6: Colors.brown,
  7: Colors.cyan,
  8: Colors.deepOrange,
  9: Colors.green,
  10: Colors.indigo,
};

class PostItem extends StatelessWidget {
  const PostItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(
        bottom: 8.0,
        left: 8.0,
        right: 8.0,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            offset: Offset(0.0, 3.0),
            blurRadius: 3.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: avatarColors[post.userId],
              ),
              const SizedBox(width: 10),
              Text('User ${post.userId}')
            ],
          ),
          const SizedBox(height: 10),
          Text(
            post.body,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ActionButton(
                icon: CupertinoIcons.hand_thumbsup,
                onTap: () {},
              ),
              ActionButton(
                icon: CupertinoIcons.bubble_left,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
