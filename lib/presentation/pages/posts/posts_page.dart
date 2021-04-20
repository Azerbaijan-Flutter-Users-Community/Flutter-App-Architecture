import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/home_bottom_bar.dart';
import 'widgets/post_item.dart';
import '../../../bloc/post/post_cubit.dart';

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColorDark,
      ),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text('Posts'),
                actions: [
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
              ),
              BlocBuilder<PostCubit, DataState<List<Post>>>(
                builder: (_, state) {
                  if (state.isInProgress) {
                    return SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (state.isSuccess) {
                    final posts = state.data!..shuffle();

                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (_, i) {
                          final post = posts[i];
                          return PostItem(post: post);
                        },
                        childCount: state.data!.length,
                      ),
                    );
                  }

                  if (state.isFailure) {
                    return SliverFillRemaining(
                      child: Text('Error occured!'),
                    );
                  }

                  return SliverToBoxAdapter(child: SizedBox());
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: HomeBottomBar(),
      ),
    );
  }
}
