import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cubit_test/data/models/post.dart';
import 'package:meta/meta.dart';

import 'package:cubit_test/data/post_repository.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostRepository postRepository;

  PostCubit({required this.postRepository}) : super(PostInitial());

  Future fetchPosts() async {
    try {
      emit(PostInitial());

      final posts = await postRepository.fetchPosts();

      emit(PostLoaded(posts: posts));
    } on HttpException catch (e) {
      emit(PostError(message: e.toString()));
    } on SocketException catch (e) {
      emit(PostError(message: e.message));
    } catch (e) {
      emit(PostError(message: e.toString()));
    }
  }
}
