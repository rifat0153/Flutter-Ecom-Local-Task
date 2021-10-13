import 'package:cubit_test/data/models/post.dart';
import 'package:cubit_test/data/post_network_service.dart';

class PostRepository {
  const PostRepository({
    required this.postNetworkService,
  });

  final PostNetworkService postNetworkService;

  Future<List<Post>> fetchPosts() async {
    final postsRaw = await postNetworkService.fetchPosts();

    return postsRaw.map((e) => Post.fromJson(e)).toList();
  }
}
