import 'package:cubit_test/cubit/post_cubit.dart';
import 'package:cubit_test/data/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreens extends StatelessWidget {
  const PostScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PostCubit>(context).fetchPosts();

    return BlocListener<PostCubit, PostState>(
      listener: (context, state) {
        if (state is PostError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.message,
              ),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo Screen'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/post_detail');
              },
              icon: const Icon(Icons.details),
            )
          ],
        ),
        body: SafeArea(
          child: BlocBuilder<PostCubit, PostState>(
            builder: (context, state) {
              if (state is PostInitial) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is PostError) {
                final errorMessage = state.message;

                return Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(errorMessage),
                    TextButton(
                        onPressed: () {
                          BlocProvider.of<PostCubit>(context).fetchPosts();
                        },
                        child: const Text('Retry'))
                  ],
                ));
              } else {
                final posts = (state as PostLoaded).posts;

                return RefreshIndicator(
                  onRefresh: () async {
                    await BlocProvider.of<PostCubit>(context).fetchPosts();
                  },
                  child: ListView(
                    children: posts.map((post) => _postTile(post, context)).toList(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _postTile(Post post, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(post.id.toString()),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              post.title,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
