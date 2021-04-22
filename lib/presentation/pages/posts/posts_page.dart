import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/post/post_cubit.dart';
import '../../../utils/extensions/waitable_cubit_ext.dart';
import 'widgets/home_bottom_bar.dart';
import 'widgets/post_item.dart';

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
              SliverFillRemaining(
                child: RefreshIndicator(
                  onRefresh: () {
                    context.read<PostCubit>().fetch();
                    return context
                        .read<PostCubit>()
                        .waitFor<DataState<List<Post>>>(
                          predicate: (state) => state.isSuccess,
                        );
                  },
                  child: BlocBuilder<PostCubit, DataState<List<Post>>>(
                    builder: (_, state) {
                      if (state.isInProgress) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state.isSuccess) {
                        final posts = state.data!..shuffle();

                        return ListView.builder(
                          itemBuilder: (_, i) {
                            final post = posts[i];
                            return PostItem(post: post);
                          },
                          itemCount: posts.length,
                        );
                      }

                      if (state.isFailure) {
                        return Text('Error occurred!');
                      }

                      return Expanded(
                        child: Container(
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: HomeBottomBar(),
      ),
    );
  }
}
