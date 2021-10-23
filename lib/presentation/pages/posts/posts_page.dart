import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../bloc/post/post_cubit.dart';
import '../../../utils/constants/routes.dart';
import '../../../utils/extensions/theme_ext.dart';
import '../../../utils/extensions/waitable_cubit_ext.dart';
import '../../global/data_item.dart';
import 'widgets/home_bottom_bar.dart';
import 'widgets/more_menu.dart';

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).statusBarColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(
                  AppLocalizations.of(context)!.posts,
                ),
                backgroundColor: Theme.of(context).statusBarColor,
                actions: [MoreMenu()],
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
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          itemBuilder: (_, i) {
                            final post = posts[i];

                            return DataItem(
                              id: post.userId,
                              body: post.body,
                              onCommentTap: () => Navigator.pushNamed(
                                context,
                                Routes.comments,
                                arguments: post.id,
                              ),
                            );
                          },
                          itemCount: posts.length,
                        );
                      }

                      if (state.isFailure) {
                        return Text('Error occurred!');
                      }

                      return Center(
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
