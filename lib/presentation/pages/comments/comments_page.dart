import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/comment/comment_cubit.dart';
import '../../global/data_item.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final commentState = context.watch<CommentCubit>().state;

    late final child;

    if (commentState.isInProgress) {
      child = Center(child: CircularProgressIndicator());
    } else if (commentState.isSuccess) {
      child = ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemBuilder: (_, i) {
          final comment = commentState.data?[i];

          return DataItem(
            id: comment!.postId,
            body: comment.body,
            showActionBar: false,
          );
        },
        itemCount: commentState.data!.length,
      );
    } else if (commentState.isFailure) {
      child = Center(child: Text('ERROR!'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Comments',
        ),
      ),
      body: SafeArea(child: child),
    );
  }
}
