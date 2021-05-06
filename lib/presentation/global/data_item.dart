import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/posts/widgets/action_button.dart';

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

class DataItem<T> extends StatelessWidget {
  const DataItem({
    Key? key,
    required this.id,
    required this.body,
    this.onLikeTap,
    this.onCommentTap,
    this.showActionBar = true,
  }) : super(key: key);

  final T id;
  final String body;
  final VoidCallback? onLikeTap;
  final VoidCallback? onCommentTap;

  final bool showActionBar;

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
        borderRadius: BorderRadius.circular(4.0),
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
                backgroundColor: avatarColors[body.length % 10],
              ),
              const SizedBox(width: 10),
              Text('$id'),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            body,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10),
          if (showActionBar) Divider(),
          if (showActionBar)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ActionButton(
                  icon: CupertinoIcons.hand_thumbsup,
                  onTap: onLikeTap,
                ),
                ActionButton(
                  icon: CupertinoIcons.bubble_left,
                  onTap: onCommentTap,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
