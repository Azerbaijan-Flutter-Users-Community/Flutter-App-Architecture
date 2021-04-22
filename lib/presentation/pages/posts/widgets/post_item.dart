import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/post.dart';

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
      margin: const EdgeInsets.only(bottom: 8.0),
      color: Colors.white,
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
          Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(width: 0.2)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(CupertinoIcons.hand_thumbsup),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(CupertinoIcons.bubble_left),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
